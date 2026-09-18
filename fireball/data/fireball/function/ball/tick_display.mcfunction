# 1. Advance timer
scoreboard players add @s fireball.spin_tick 1

# 2. Phase 1 (0° -> 120° tumble over 6 ticks)
execute if score @s fireball.spin_tick matches 6 run data merge entity @s {start_interpolation:0,interpolation_duration:6,transformation:{left_rotation:[0.5f,0.5f,0.5f,0.5f],right_rotation:[0f,0f,0f,1f]}}

# 3. Phase 2 (120° -> 240° tumble over 6 ticks)
execute if score @s fireball.spin_tick matches 12 run data merge entity @s {start_interpolation:0,interpolation_duration:6,transformation:{left_rotation:[0.5f,0.5f,0.5f,-0.5f],right_rotation:[0f,0f,0f,1f]}}

# 4. Phase 3 (240° -> 360° reset over 6 ticks)
# warn-off execute-group
execute if score @s fireball.spin_tick matches 18.. run data merge entity @s {start_interpolation:0,interpolation_duration:6,transformation:{left_rotation:[0.0f,0.0f,0.0f,1.0f],right_rotation:[0f,0f,0f,1f]}}

# 5. Loop reset
execute if score @s fireball.spin_tick matches 18.. run scoreboard players set @s fireball.spin_tick 0

# particle
particle minecraft:flame ~ ~ ~ 0 0 0 1 0 force @a