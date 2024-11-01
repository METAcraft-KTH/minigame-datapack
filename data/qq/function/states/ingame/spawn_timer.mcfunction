execute if entity @s[gamemode=creative] run return 0


## Title
scoreboard players operation .sec var = #80 var
scoreboard players operation .sec var -= @s GLOBAL.time_alive
scoreboard players operation .sec var /= #20 var
title @s times 0 2 0
title @s title ""
title @s subtitle ["",{"text":"Spawning in ","color":"yellow"},{"score":{"name":".sec","objective":"var"},"bold":true,"color":"gold"}]


## Respawn
execute unless score @s GLOBAL.time_alive matches 60 run return 0

gamemode adventure @s
tp @s @e[tag=qq.spawnpoint,distance=..200,limit=1,sort=random]
