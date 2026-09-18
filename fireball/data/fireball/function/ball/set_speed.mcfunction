# called on root
$data modify entity @s data.speed set value $(speed)
execute store result score @s fireball.step_count run data get entity @s data.speed
scoreboard players add @s fireball.step_count 1
execute store result score #len temp run data get entity @s data.speed 1000
scoreboard players operation #len temp /= @s fireball.step_count
execute store result entity @s data.step_len float 0.001 run scoreboard players get #len temp

