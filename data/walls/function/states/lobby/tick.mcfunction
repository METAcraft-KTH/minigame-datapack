## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function walls:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function walls:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function walls:states/lobby/respawn

# increment timer
scoreboard players add ?timer WALLS.game 1
# calculate remaining time
scoreboard players operation #remainingseconds WALLS.game = time.lobby WALLS.config
scoreboard players operation #remainingseconds WALLS.game -= ?timer WALLS.game
scoreboard players operation #remainingseconds WALLS.game /= 20 GLOBAL
scoreboard players operation #displayminutes WALLS.game = #remainingseconds WALLS.game
scoreboard players operation #displayminutes WALLS.game /= 60 GLOBAL
scoreboard players operation #displayseconds WALLS.game = #remainingseconds WALLS.game
scoreboard players operation #displayseconds WALLS.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds WALLS.game matches ..9 run bossbar set walls:timer name [{"score": {"name": "#displayminutes","objective": "WALLS.game"}},":0",{"score": {"name": "#displayseconds","objective": "WALLS.game"}}," until WALLS begins"]
execute if score #displayseconds WALLS.game matches 10.. run bossbar set walls:timer name [{"score": {"name": "#displayminutes","objective": "WALLS.game"}},":",{"score": {"name": "#displayseconds","objective": "WALLS.game"}}," until WALLS begins"]
execute store result bossbar walls:timer value run scoreboard players get ?timer WALLS.game

## start game
execute if score ?timer WALLS.game >= time.lobby WALLS.config run function walls:states/pregame/start
