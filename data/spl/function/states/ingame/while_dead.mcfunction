# This function is run every tick while the player is in the respawn menu (or just 1 tick if doImmediateRespawn is true).

## !!!ADD BELOW!!! do whatever you need.
# remember that things like awarding kills is better done with advancements.

summon lightning_bolt ~ ~ ~
gamemode spectator @s
tag @s add spl.dead
execute at @e[tag=spleef_center,limit=1] run tp @s ~ 180 ~
scoreboard players operation @s Spleef.PlayerPlacement = .playersleft Spleef.State
scoreboard players remove .playersleft Spleef.State 1

tellraw @a [{"selector":"@s"},{"text":" has fallen through the world!","color":"gray"}]
tellraw @a [{"score":{"name":".playersleft","objective":"Spleef.State"},"color":"red"},{"text":" players remain!"}]

scoreboard players add .rain Spleef.State 1

## points!
execute if score @s Spleef.PlayerPlacement matches 2 run function score:add_points {points:125}
execute if score @s Spleef.PlayerPlacement matches 3 run function score:add_points {points:100}
execute if score @s Spleef.PlayerPlacement matches 4 run function score:add_points {points:75}
execute if score @s Spleef.PlayerPlacement matches 5 run function score:add_points {points:50}
execute if score @s Spleef.PlayerPlacement matches 6 run function score:add_points {points:25}
execute if score @s Spleef.PlayerPlacement matches 7 run function score:add_points {points:10}

execute as @a[tag=spleef_ingame,tag=!spl.dead] run function score:add_points {points:5}