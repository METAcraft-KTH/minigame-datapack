# roundID Round id

$scoreboard players set #roundID WALLS.tmp $(roundID)

$execute store success score #red_success WALLS.tmp run function walls:states/ingame/team/is_team_smallest.r$(roundID) {smallest: "red", team2: "blue", team3: "yellow", team4: "green"}
$execute store success score #blue_success WALLS.tmp run function walls:states/ingame/team/is_team_smallest.r$(roundID) {smallest: "blue", team2: "red", team3: "yellow", team4: "green"}
$execute if score #roundID WALLS.tmp matches 1 store success score #green_success WALLS.tmp run function walls:states/ingame/team/is_team_smallest.r$(roundID) {smallest: "green", team2: "blue", team3: "yellow", team4: "red"}
$execute if score #roundID WALLS.tmp matches 1 store success score #yellow_success WALLS.tmp run function walls:states/ingame/team/is_team_smallest.r$(roundID) {smallest: "yellow", team2: "blue", team3: "red", team4: "green"}


data remove storage walls:temp team_randomizer
execute if score #red_success WALLS.tmp matches 1.. run data modify storage walls:temp team_randomizer insert 0 value "red"
execute if score #blue_success WALLS.tmp matches 1.. run data modify storage walls:temp team_randomizer insert 0 value "blue"
execute if score #roundID WALLS.tmp matches 1 if score #yellow_success WALLS.tmp matches 1.. run data modify storage walls:temp team_randomizer insert 0 value "yellow"
execute if score #roundID WALLS.tmp matches 1 if score #green_success WALLS.tmp matches 1.. run data modify storage walls:temp team_randomizer insert 0 value "green"


execute store result score team_randomizer_size WALLS.tmp run data get storage walls:temp team_randomizer
scoreboard players remove team_randomizer_size WALLS.tmp 1
execute store result storage walls:temp max int 1 run scoreboard players get team_randomizer_size WALLS.tmp
data merge storage walls:temp {min:0}

execute store result storage walls:temp teamIndex int 1 run function walls:helper/pick_random_number with storage walls:temp

function walls:states/ingame/team/pick_team_from_index with storage walls:temp
function walls:states/ingame/team/add_to_team with storage walls:temp
