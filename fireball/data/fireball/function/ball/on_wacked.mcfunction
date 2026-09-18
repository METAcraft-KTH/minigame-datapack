# ran on the root
execute on passengers run function fireball:ball/on_wacked_passengers

#function fireball:ball/select_target

## Update target_uuid_string
execute as @p[tag=fireball.target] run function fireball:ball/set_target

## Increase speed
execute store result entity @s data.speed float 0.001 run data get entity @s data.speed 1100
function fireball:ball/set_speed with entity @s data

## Reset wack age
scoreboard players set @s fireball.wack_age 0

## Play sound
playsound minecraft:entity.sulfur_cube.fast_flat.hit hostile @a ~ ~ ~ 3 1 0.3
