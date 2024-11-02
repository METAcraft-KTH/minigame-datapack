execute store result storage walls:temp xDist int 1 run scoreboard players get @s WALLS.lava_point_x_dist
execute store result storage walls:temp zDist int 1 run scoreboard players get @s WALLS.lava_point_z_dist

execute store result score #y_height WALLS.tmp run data get entity @s Pos[1]
execute if score #y_height WALLS.tmp < @s WALLS.lava_max_y if score @s WALLS.lava_timer matches ..0 run function walls:states/ingame/lava/update_lava_points_active

execute store result storage walls:temp y int 1 run data get entity @s Pos[1]
function walls:states/ingame/lava/notify_players with storage walls:temp

execute if score @s WALLS.lava_timer matches 1.. run scoreboard players remove @s WALLS.lava_timer 1

