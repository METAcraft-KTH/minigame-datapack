scoreboard players remove #i temp 1
$tp @s ^ ^ ^$(step_len)
execute on passengers if entity @s[type=item_display,tag=direction] run rotate @s ~ ~
## Do step checks
# player collision test
execute positioned ~-0.5 ~ ~-0.5 if entity @a[tag=!admin,dx=0,dy=0,dz=0,gamemode=!spectator,gamemode=!creative] run function fireball:ball/explode
# ground collision test
# bounce or explode
execute unless block ^ ^ ^1 #air run function fireball:ball/on_touch_ground with entity @s data



execute if score #i temp matches 1.. positioned as @s rotated as @n[tag=direction,distance=..10,type=item_display] run return run function fireball:ball/move_step with entity @s data