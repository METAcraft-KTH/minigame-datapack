execute if entity @s[gamemode=creative] run return 0


## Title
scoreboard players operation .sec var = #80 var
scoreboard players operation .sec var -= @s qq.time_alive
scoreboard players operation .sec var /= #20 var
title @s times 0 2 0
title @s title ""
title @s subtitle ["",{"text":"Spawning in ","color":"yellow"},{"score":{"name":".sec","objective":"var"},"bold":true,"color":"gold"}]

## Spectate
execute if entity @s[tag=qq.jumpJustDown] run spectate @e[tag=qq.spectate,tag=qq.active_arena,limit=1,sort=random,distance=1..] @s
execute if score @s qq.time_alive matches 1.. at @s run spectate @n[tag=qq.spectate,tag=qq.active_arena] @s

## Respawn
execute unless score @s qq.time_alive matches 60 run return 0

gamemode adventure @s
tp @s @e[tag=qq.spawnpoint,tag=qq.active_arena,limit=1,sort=random]
