# Input:
#     "100size", the size (half-height) that the border should target multiplied by 100
#     "time" the time in ticks it should take to get there

$scoreboard players set #100size uhc.temp $(100size)
$scoreboard players set #time uhc.temp $(time)

execute if score #time uhc.temp matches 0 run scoreboard players operation ?world_border_size_100x uhc.state = #100size uhc.temp
execute if score #time uhc.temp matches 0 run scoreboard players operation ?world_border_size_target_100x uhc.state = #100size uhc.temp
execute if score #time uhc.temp matches 0 run return 0

scoreboard players operation ?world_border_size_target_100x uhc.state = #100size uhc.temp
scoreboard players set #100diff uhc.temp 0
scoreboard players operation #100diff uhc.temp = ?world_border_size_target_100x uhc.state
scoreboard players operation #100diff uhc.temp -= ?world_border_size_100x uhc.state
scoreboard players operation ?world_border_dsize_dt_100x uhc.state = #100diff uhc.temp
scoreboard players operation ?world_border_dsize_dt_100x uhc.state /= #time uhc.temp

function uhc:border/border_tick
