## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function ttag:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function ttag:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function ttag:states/lobby/respawn

# increment timer
scoreboard players add ?timer ttag.game 1
# calculate remaining time
scoreboard players operation #remainingseconds ttag.game = time.lobby ttag.config
scoreboard players operation #remainingseconds ttag.game -= ?timer ttag.game
scoreboard players operation #remainingseconds ttag.game /= 20 GLOBAL
scoreboard players operation #displayminutes ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayminutes ttag.game /= 60 GLOBAL
scoreboard players operation #displayseconds ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayseconds ttag.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds ttag.game matches ..9 run bossbar set ttag:timer name ["MINECRAFT HEXATHLON starts in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":0",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute if score #displayseconds ttag.game matches 10.. run bossbar set ttag:timer name ["MINECRAFT HEXATHLON starts in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute store result bossbar ttag:timer value run scoreboard players get ?timer ttag.game

## set spawn point & world spawn
spawnpoint @a 10000 64 0 0
setworldspawn 10000 64 0 0
gamemode adventure @a[tag=!admin,gamemode=!adventure]

title @a[tag=!uni_selected] actionbar {"text":"Welcome to MINECRAFT HEXATHLON! You have not selected your university. Talk to the glowing NPC!"}
title @a[tag=uni_selected] actionbar {"text":"Welcome to MINECRAFT HEXATHLON! You have selected your university. Get ready to start!"}

## start game
execute if score ?timer ttag.game >= time.lobby ttag.config run function ttag:states/pregame/start