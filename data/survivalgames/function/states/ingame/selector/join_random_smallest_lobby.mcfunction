
execute store success score #lobby1_smallest SURVIVALGAMES.tmp run function survivalgames:states/ingame/selector/is_lobby_smallest {smallest: "lobby1", other: "lobby2", other2: "lobby3"}
execute store success score #lobby2_smallest SURVIVALGAMES.tmp run function survivalgames:states/ingame/selector/is_lobby_smallest {smallest: "lobby2", other: "lobby1", other2: "lobby3"}
execute store success score #lobby3_smallest SURVIVALGAMES.tmp run function survivalgames:states/ingame/selector/is_lobby_smallest {smallest: "lobby3", other: "lobby2", other2: "lobby1"}

scoreboard players set #24 SURVIVALGAMES.tmp 24
scoreboard players set #48 SURVIVALGAMES.tmp 48
data remove storage survivalgames:temp lobby_randomizer
execute if score #lobby1_smallest SURVIVALGAMES.tmp matches 1.. run data modify storage survivalgames:temp lobby_randomizer insert 0 value 1
execute if score playercount SURVIVALGAMES.game > #24 if score #lobby2_smallest SURVIVALGAMES.tmp matches 1.. run data modify storage survivalgames:temp lobby_randomizer insert 0 value 2
execute if score playercount SURVIVALGAMES.game > #48 if score #lobby3_smallest SURVIVALGAMES.tmp matches 1.. run data modify storage survivalgames:temp lobby_randomizer insert 0 value 3


execute store result score lobby_randomizer_size SURVIVALGAMES.tmp run data get storage survivalgames:temp lobby_randomizer
scoreboard players remove lobby_randomizer_size SURVIVALGAMES.tmp 1
execute store result storage survivalgames:temp max int 1 run scoreboard players get lobby_randomizer_size SURVIVALGAMES.tmp
data merge storage walls:temp {min:0}

execute store result storage survivalgames:temp index int 1 run function survivalgames:helper/pick_random_number with storage survivalgames:temp

execute store result storage survivalgames:temp id run function survivalgames:states/ingame/selector/pick_lobby_from_index with storage survivalgames:temp
function survivalgames:states/ingame/selector/add_to_lobby with storage survivalgames:temp
