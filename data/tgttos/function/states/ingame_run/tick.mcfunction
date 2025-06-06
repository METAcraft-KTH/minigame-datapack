## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tgttos:states/ingame_run/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tgttos:states/ingame_run/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tgttos:states/ingame_run/respawn

# increment timer
scoreboard players add ?timer tgttos.game 1
# calculate remaining time
scoreboard players operation #remainingseconds tgttos.game = time.postgame tgttos.config
scoreboard players operation #remainingseconds tgttos.game -= ?timer tgttos.game
scoreboard players operation #remainingseconds tgttos.game /= 20 GLOBAL
scoreboard players operation #displayminutes tgttos.game = #remainingseconds tgttos.game
scoreboard players operation #displayminutes tgttos.game /= 60 GLOBAL
scoreboard players operation #displayseconds tgttos.game = #remainingseconds tgttos.game
scoreboard players operation #displayseconds tgttos.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds tgttos.game matches ..9 run bossbar set tgttos:timer name ["Round ends in ",{"score": {"name": "#displayminutes","objective": "tgttos.game"}},":0",{"score": {"name": "#displayseconds","objective": "tgttos.game"}}]
execute if score #displayseconds tgttos.game matches 10.. run bossbar set tgttos:timer name ["Round ends in ",{"score": {"name": "#displayminutes","objective": "tgttos.game"}},":",{"score": {"name": "#displayseconds","objective": "tgttos.game"}}]
execute store result bossbar tgttos:timer value run scoreboard players get ?timer tgttos.game

# title
title @a times 0 10 0
title @a title ""

# kill players who fall off
execute at @n[type=marker,tag=tgttos.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~
execute as @a[tag=!admin,scores={tgttos.Y=..0}] run kill @s

effect give @a[tag=!admin] saturation infinite 0 true
effect give @a[tag=!admin] resistance infinite 4 true

## end game
execute if score ?timer tgttos.game >= time.ingame_run tgttos.config run function tgttos:states/ingame_pause/start