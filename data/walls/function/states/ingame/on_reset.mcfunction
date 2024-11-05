# id
setblock ~ ~ ~ structure_block
$data merge storage walls:reset_temp {id: $(id)}
execute store result storage walls:reset_temp index int 1 run scoreboard players get @s WALLS.reset_ids
function walls:states/ingame/set_reset_data with walls:reset_temp
setblock ~ ~1 ~ redstone_block
fill ~ ~ ~ ~ ~1 ~ barrier
