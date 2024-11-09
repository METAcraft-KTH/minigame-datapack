scoreboard players add @s hh.checkpoint 1
clear @s elytra
spawnpoint @s ~ ~ ~ ~
xp add @s 90 levels
title @s actionbar "YOU GOT TO THE END!"
tellraw @a ["",{"selector":"@s","bold":true,"color":"yellow"},{"text":" has made it to the end!","color":"gold"}]

# POINT SYSTEM
function score:add_points {points:50}