## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function survivalgames:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function survivalgames:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function survivalgames:states/lobby/respawn

# increment timer
scoreboard players add ?timer SURVIVALGAMES.game 1
# calculate remaining time
scoreboard players operation #remainingseconds SURVIVALGAMES.game = time.lobby SURVIVALGAMES.config
scoreboard players operation #remainingseconds SURVIVALGAMES.game -= ?timer SURVIVALGAMES.game
scoreboard players operation #remainingseconds SURVIVALGAMES.game /= 20 GLOBAL
scoreboard players operation #displayminutes SURVIVALGAMES.game = #remainingseconds SURVIVALGAMES.game
scoreboard players operation #displayminutes SURVIVALGAMES.game /= 60 GLOBAL
scoreboard players operation #displayseconds SURVIVALGAMES.game = #remainingseconds SURVIVALGAMES.game
scoreboard players operation #displayseconds SURVIVALGAMES.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds SURVIVALGAMES.game matches ..9 run bossbar set survivalgames:timer name [{"score": {"name": "#displayminutes","objective": "SURVIVALGAMES.game"}},":0",{"score": {"name": "#displayseconds","objective": "SURVIVALGAMES.game"}}," until SURVIVALGAMES begins"]
execute if score #displayseconds SURVIVALGAMES.game matches 10.. run bossbar set survivalgames:timer name [{"score": {"name": "#displayminutes","objective": "SURVIVALGAMES.game"}},":",{"score": {"name": "#displayseconds","objective": "SURVIVALGAMES.game"}}," until SURVIVALGAMES begins"]
execute store result bossbar survivalgames:timer value run scoreboard players get ?timer SURVIVALGAMES.game

## start game
execute if score ?timer SURVIVALGAMES.game >= time.lobby SURVIVALGAMES.config run function survivalgames:states/pregame/start
