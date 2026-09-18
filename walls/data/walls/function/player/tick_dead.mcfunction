# ============================================================
# walls:player/tick_dead
# Called by: walls:player/tick
# Executor:  A player waiting to respawn
# ============================================================

scoreboard players remove @s walls.respawn 1

scoreboard players operation #ticks main.temp = @s walls.respawn
execute store result score #sec walls.temp run compute default integer main:time/total_sec
title @s actionbar [{text:"Respawning in ",color:"gray"},{score:{name:"#sec",objective:"walls.temp"},color:"yellow"},{text:"s",color:"gray"}]

execute if score @s walls.respawn matches ..0 run function walls:player/respawn
