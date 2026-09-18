# explode if bounced 3 times
scoreboard players add @s fireball.bounce_count 1
execute if score @s fireball.bounce_count matches 3.. run return run function fireball:ball/explode

# else, bounce
execute on passengers if entity @s[type=item_display,tag=direction] store result entity @s Rotation[1] float 0.001 run data get entity @s Rotation[1] -1000
playsound minecraft:entity.magma_cube.hurt hostile @a ~ ~ ~ 10 1.7 0