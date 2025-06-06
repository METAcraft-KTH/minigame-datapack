## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tgttos:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tgttos:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tgttos:states/lobby/respawn

# increment timer
scoreboard players add ?timer tgttos.game 1
# calculate remaining time
scoreboard players operation #remainingseconds tgttos.game = time.lobby tgttos.config
scoreboard players operation #remainingseconds tgttos.game -= ?timer tgttos.game
scoreboard players operation #remainingseconds tgttos.game /= 20 GLOBAL
scoreboard players operation #displayminutes tgttos.game = #remainingseconds tgttos.game
scoreboard players operation #displayminutes tgttos.game /= 60 GLOBAL
scoreboard players operation #displayseconds tgttos.game = #remainingseconds tgttos.game
scoreboard players operation #displayseconds tgttos.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds tgttos.game matches ..9 run bossbar set tgttos:timer name [{"score": {"name": "#displayminutes","objective": "tgttos.game"}},":0",{"score": {"name": "#displayseconds","objective": "tgttos.game"}}," until TGTTOS begins"]
execute if score #displayseconds tgttos.game matches 10.. run bossbar set tgttos:timer name [{"score": {"name": "#displayminutes","objective": "tgttos.game"}},":",{"score": {"name": "#displayseconds","objective": "tgttos.game"}}," until TGTTOS begins"]
execute store result bossbar tgttos:timer value run scoreboard players get ?timer tgttos.game

## start game
execute if score ?timer tgttos.game >= time.lobby tgttos.config run scoreboard players set ?round.number tgttos.game 1
execute if score ?timer tgttos.game >= time.lobby tgttos.config run function tgttos:states/pregame/start