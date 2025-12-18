## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function atc:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function atc:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function atc:states/lobby/respawn

# increment timer
scoreboard players add ?timer atc.game 1
# calculate remaining time
scoreboard players operation #remainingseconds atc.game = time.lobby atc.config
scoreboard players operation #remainingseconds atc.game -= ?timer atc.game
scoreboard players operation #remainingseconds atc.game /= 20 GLOBAL
scoreboard players operation #displayminutes atc.game = #remainingseconds atc.game
scoreboard players operation #displayminutes atc.game /= 60 GLOBAL
scoreboard players operation #displayseconds atc.game = #remainingseconds atc.game
scoreboard players operation #displayseconds atc.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds atc.game matches ..9 run bossbar set atc:timer name [{"score": {"name": "#displayminutes","objective": "atc.game"}},":0",{"score": {"name": "#displayseconds","objective": "atc.game"}}," until Among the Crowd begins"]
execute if score #displayseconds atc.game matches 10.. run bossbar set atc:timer name [{"score": {"name": "#displayminutes","objective": "atc.game"}},":",{"score": {"name": "#displayseconds","objective": "atc.game"}}," until Among the Crowd begins"]
execute store result bossbar atc:timer value run scoreboard players get ?timer atc.game

## start game
execute if score ?timer atc.game >= time.lobby atc.config run function atc:states/pregame/start
