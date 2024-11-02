tp @s ~ ~ ~
execute if block ~ ~ ~ #minecraft:slabs at @s run function qq:raycast/partial/slabs
execute if block ~ ~ ~ #minecraft:stairs at @s run function qq:raycast/partial/stairs
execute if block ~ ~ ~ #minecraft:doors at @s run function qq:raycast/partial/doors
execute if block ~ ~ ~ #minecraft:trapdoors at @s run function qq:raycast/partial/trapdoors

execute if block ~ ~ ~ #minecraft:beds at @s run function qq:raycast/partial/bottom_half
execute if block ~ ~ ~ #minecraft:candle_cakes at @s run function qq:raycast/partial/bottom_half
execute if block ~ ~ ~ minecraft:cake at @s run function qq:raycast/partial/bottom_half
execute if block ~ ~ ~ minecraft:daylight_detector at @s run function qq:raycast/partial/bottom_half
execute if block ~ ~ ~ minecraft:stonecutter at @s run function qq:raycast/partial/bottom_half
execute if block ~ ~ ~ minecraft:sculk_sensor at @s run function qq:raycast/partial/bottom_half
execute if block ~ ~ ~ minecraft:calibrated_sculk_sensor at @s run function qq:raycast/partial/bottom_half
