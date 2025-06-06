#include <filesystem>
#include <fstream>
#include <nlohmann/json.hpp>
#include <string>
#include <vector>
#include <unordered_set>
#include <boost/algorithm/string/replace.hpp>

using json = nlohmann::json;
namespace fs {
	using namespace std::filesystem;
}

const std::string NS = "buildmart";

struct Identifier {
	std::string ns;
	std::string path;
	bool tag = false;

	static Identifier from(const std::string& string, bool tag = false) {
		size_t pos = string.find(":");
		Identifier id;
		if (pos == std::string::npos) {
			id.ns = "minecraft";
			id.path = string;
		} else {
			id.ns = string.substr(0, pos);
			id.path = string.substr(pos+1, string.size()-(pos+1));
		}
		id.tag = tag;
		return id;
	}

	std::string toString(const std::string& separator = ":") const {
		return (tag ? "#" : "") + ns + separator + path;
	}
};

template<>
struct std::hash<Identifier> {
	std::size_t operator()(const Identifier& id) const {
		return std::hash<std::string>{}(id.toString());
	}
};

template<>
struct std::equal_to<Identifier> {
	std::size_t operator()(const Identifier& lhs, const Identifier& rhs) const {
		return lhs.ns == rhs.ns && lhs.path == rhs.path && lhs.tag == rhs.tag;
	}
};

std::string getBuildName() {
	auto name = fs::current_path().filename().string();
	boost::replace_all(name, "-", "_");
	return name + "_data_pack";
}

const fs::path build = "./build/" + getBuildName();

const fs::path dataDir = build / ("data/" + NS);

const fs::path advancementPrefix = dataDir / "advancement";
const std::string showDir = "items/show/";
const std::string collectDir = "items/collect";

const fs::path functionPrefix = dataDir / "function";
const std::string itemCollectFunctionDir = "items/collect";

void prepareDir(const fs::path& path) {
	if (fs::exists(path)) {
		for (const auto& f : fs::directory_iterator(path)) {
			fs::remove_all(f);
		}
	} else {
		fs::create_directories(path);
	}
}

void prepareDirectories() {
	prepareDir(advancementPrefix / showDir);
	prepareDir(advancementPrefix / collectDir);
	prepareDir(functionPrefix / itemCollectFunctionDir);
}

const std::unordered_set<Identifier> KNOWN_BLOCKS{
	Identifier::from("minecraft:blast_furnace"),
	Identifier::from("minecraft:comparator"),
	Identifier::from("minecraft:respawn_anchor"),
	Identifier::from("minecraft:ender_chest"),
	Identifier::from("minecraft:target"),
	Identifier::from("minecraft:sticky_piston"),
	Identifier::from("minecraft:grindstone"),
	Identifier::from("minecraft:lectern"),
	Identifier::from("minecraft:cake"),
	Identifier::from("minecraft:soul_campfire")
};

std::string getPrefix(const Identifier& item) {
	return KNOWN_BLOCKS.contains(item) ? "block" : "item";
}

void generateItemAdvancement(const Identifier& item) {
	json::object_t holder_advancement;
	holder_advancement["parent"] = NS + ":items/root";
	holder_advancement["criteria"] = {
		{"dummy", {{"trigger", "impossible"}}}
	};
	holder_advancement["display"] = {
		{"icon", {{"id", "diamond"}, {"components", {{"minecraft:item_model", "air"}}}}},
		{"announce_to_chat", false,},
		{"show_toast", false},
		{"title", {{"text", ""}}},
		{"description", {{"text", ""}}},
		{"hidden", true}
	};
	holder_advancement["requirements"] = {{"dummy"}};

	const auto showName = showDir + item.toString(".");

	std::ofstream o(advancementPrefix / (showName + ".json"));
	o << std::setw(4) << holder_advancement;

	const auto showFull = Identifier{NS, showName}.toString();

	json::object_t item_advancement;
	item_advancement["parent"] = showFull;
	item_advancement["criteria"] = {
		{"collect", {
			{"trigger", "tick"},
			{"conditions", {
				{"player", {
					{"type_specific", {
						{"type", "player"},
						{"advancements", {
							{showFull, true}
						}}
					}},
					{"location", {
						{"zone", "BuildMartCollect"}
					}},
					{"slots", {
						{"container.*", {
							{"items", {
								item.toString()
							}}
						}}
					}}
				}}
			}}
		}}
	};
	item_advancement["display"] = {
		{"icon", {{"id", item.toString()}}},
		{"announce_to_chat", true},
		{"show_toast", true},
		{"title", {{"translate", getPrefix(item) + "." + item.ns + "." + item.path}}},
		{"description", {{"text", ""}}}
	};
	item_advancement["rewards"] = {
		{"function", Identifier{NS, itemCollectFunctionDir}.toString() + "/" + item.toString(".")}
	};
	item_advancement["requirements"] = {{"collect"}};

	std::ofstream o2(advancementPrefix / collectDir / (item.toString(".") + ".json"));
	o2 << std::setw(4) << item_advancement;
}

void generateFunction(const Identifier& item) {
	auto itemTagName = item.toString(".");
	std::ofstream function(functionPrefix / itemCollectFunctionDir / (itemTagName + ".mcfunction"));
	function << "clear @s " + item.toString() + " 1" << std::endl;
	function << "scoreboard players add @s buildmart.items_collected 1" << std::endl;
	function << "tag @s add " << itemTagName << std::endl;
	function << "function buildmart:states/ingame/helper/grant_points {tag: " + itemTagName + "}" << std::endl;
}

void generate_items() {
	prepareDirectories();
	json items;
	std::ifstream validItems("valid_items.json");
	validItems >> items;
	for (const auto& item : items) {
		auto id = Identifier::from(item);
		generateItemAdvancement(id);
		generateFunction(id);
	}
}

int main() {
	generate_items();
}
