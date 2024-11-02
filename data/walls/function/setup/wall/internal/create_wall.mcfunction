#action: Action to run on the wall after setting data.
summon marker ~ ~ ~ {Tags:["WALLS.wall"]}
function walls:helper/copy_rotation
$execute as @e[tag=WALLS.wall,limit=1,distance=..0.1] at @s run function walls:setup/wall/internal/set_wall_data {action: "$(action)"}
