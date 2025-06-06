## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function buildmart:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function buildmart:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function buildmart:states/lobby/respawn

# increment timer
scoreboard players add ?timer buildmart.game 1
# calculate remaining time
scoreboard players operation #remainingseconds buildmart.game = time.lobby buildmart.config
scoreboard players operation #remainingseconds buildmart.game -= ?timer buildmart.game
scoreboard players operation #remainingseconds buildmart.game /= 20 GLOBAL
scoreboard players operation #displayminutes buildmart.game = #remainingseconds buildmart.game
scoreboard players operation #displayminutes buildmart.game /= 60 GLOBAL
scoreboard players operation #displayseconds buildmart.game = #remainingseconds buildmart.game
scoreboard players operation #displayseconds buildmart.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds buildmart.game matches ..9 run bossbar set buildmart:timer name [{"score": {"name": "#displayminutes","objective": "buildmart.game"}},":0",{"score": {"name": "#displayseconds","objective": "buildmart.game"}}," until First we mine, then we craft begins"]
execute if score #displayseconds buildmart.game matches 10.. run bossbar set buildmart:timer name [{"score": {"name": "#displayminutes","objective": "buildmart.game"}},":",{"score": {"name": "#displayseconds","objective": "buildmart.game"}}," until First we mine, then we craft begins"]
execute store result bossbar buildmart:timer value run scoreboard players get ?timer buildmart.game

## start game
execute if score ?timer buildmart.game >= time.lobby buildmart.config run function buildmart:states/pregame/start
