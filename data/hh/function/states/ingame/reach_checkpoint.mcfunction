# reset checkpoint deaths
scoreboard players reset @s hh.checkpointDeaths

# spawnpoint and checpoint score
spawnpoint @s ~ ~ ~ ~
scoreboard players operation @s hh.checkpoint = @n[tag=hh.checkpoint, distance=..10] hh.checkpoint
playsound entity.arrow.hit_player player @s ~ ~ ~ 0.3 1 1
xp add @s 1 levels
title @s actionbar "Checkpoint reached"

# POINT SYSTEM
function score:add_points {points:50}