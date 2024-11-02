execute store result storage walls:temp forward int 1 run scoreboard players get @s WALLS.wall_length
execute store result storage walls:temp up int 1 run scoreboard players get @s WALLS.wall_height
data merge storage walls:temp {toFill:"bedrock",toReplace:"#walls:can_wall_replace"}
execute at @s run function walls:states/ingame/wall/fill_wall with storage walls:temp

function walls:get_wall_id
data merge storage walls:temp {action: "function walls:states/ingame/wall/raise_wall"}
function walls:states/ingame/wall/for_mimics with storage walls:temp
