execute if score #yaw WALLS.tmp matches -45..45 run data merge entity @s {Rotation:[0f,0f]}
execute if score #yaw WALLS.tmp matches 45..135 run data merge entity @s {Rotation:[90f,0f]}
execute if score #yaw WALLS.tmp matches -135..-45 run data merge entity @s {Rotation:[-90f,0f]}
execute unless score #yaw WALLS.tmp matches -135..135 run data merge entity @s {Rotation:[180f,0f]}
