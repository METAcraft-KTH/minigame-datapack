execute if score @s WALLS.lava_delay matches 1.. run scoreboard players remove @s WALLS.lava_delay 1

execute if score @s WALLS.lava_delay matches ..0 run function walls:states/ingame/lava/place_lava with storage walls:temp

execute if score @s WALLS.lava_delay matches ..0 run scoreboard players operation @s WALLS.lava_delay = @s WALLS.lava_delay_max


