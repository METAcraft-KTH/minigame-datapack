execute store result storage walls:temp forward int 1 run scoreboard players get @s WALLS.wall_length
execute store result storage walls:temp up int 1 run scoreboard players get @s WALLS.wall_height
execute if score @s WALLS.type matches 0 run data merge storage walls:temp {toFill:"air",toReplace:"bedrock"}
execute if score @s WALLS.type matches 1 run data merge storage walls:temp {toFill:"stone",toReplace:"bedrock"}
execute at @s run function walls:states/ingame/wall/fill_wall with storage walls:temp

function walls:get_wall_id
data merge storage walls:temp {action: "function walls:states/ingame/wall/drop_wall"}
function walls:states/ingame/wall/for_mimics with storage walls:temp
