## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function hh:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function hh:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function hh:states/lobby/respawn

# increment timer
scoreboard players add ?timer hh.game 1
# calculate remaining time
scoreboard players operation #remainingseconds hh.game = time.lobby hh.config
scoreboard players operation #remainingseconds hh.game -= ?timer hh.game
scoreboard players operation #remainingseconds hh.game /= 20 GLOBAL
scoreboard players operation #displayminutes hh.game = #remainingseconds hh.game
scoreboard players operation #displayminutes hh.game /= 60 GLOBAL
scoreboard players operation #displayseconds hh.game = #remainingseconds hh.game
scoreboard players operation #displayseconds hh.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds hh.game matches ..9 run bossbar set hh:timer name [{"score": {"name": "#displayminutes","objective": "hh.game"}},":0",{"score": {"name": "#displayseconds","objective": "hh.game"}}," until hh begins"]
execute if score #displayseconds hh.game matches 10.. run bossbar set hh:timer name [{"score": {"name": "#displayminutes","objective": "hh.game"}},":",{"score": {"name": "#displayseconds","objective": "hh.game"}}," until hh begins"]
execute store result bossbar hh:timer value run scoreboard players get ?timer hh.game

## start game
execute if score ?timer hh.game >= time.lobby hh.config run function hh:states/pregame/start