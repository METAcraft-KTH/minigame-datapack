## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function koth:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function koth:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function koth:states/lobby/respawn

# increment timer
scoreboard players add ?timer koth.game 1
# calculate remaining time
scoreboard players operation #remainingseconds koth.game = time.lobby koth.config
scoreboard players operation #remainingseconds koth.game -= ?timer koth.game
scoreboard players operation #remainingseconds koth.game /= 20 GLOBAL
scoreboard players operation #displayminutes koth.game = #remainingseconds koth.game
scoreboard players operation #displayminutes koth.game /= 60 GLOBAL
scoreboard players operation #displayseconds koth.game = #remainingseconds koth.game
scoreboard players operation #displayseconds koth.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds koth.game matches ..9 run bossbar set koth:timer name [{"score": {"name": "#displayminutes","objective": "koth.game"}},":0",{"score": {"name": "#displayseconds","objective": "koth.game"}}," until King of Three Hills begins"]
execute if score #displayseconds koth.game matches 10.. run bossbar set koth:timer name [{"score": {"name": "#displayminutes","objective": "koth.game"}},":",{"score": {"name": "#displayseconds","objective": "koth.game"}}," until King of Three Hills begins"]
execute store result bossbar koth:timer value run scoreboard players get ?timer koth.game

## start game
execute if score ?timer koth.game >= time.lobby koth.config run function koth:states/pregame/start