function walls:helper/center_position
scoreboard players operation @s WALLS.lava_point_x_dist = lava.point_x_dist WALLS.config
scoreboard players operation @s WALLS.lava_point_z_dist = lava.point_z_dist WALLS.config

scoreboard players operation @s WALLS.lava_timer = lava.timer WALLS.config
scoreboard players set @s WALLS.lava_delay 1
scoreboard players operation @s WALLS.lava_delay_max = lava.delay WALLS.config
scoreboard players operation @s WALLS.lava_max_y = lava.max_y WALLS.config
