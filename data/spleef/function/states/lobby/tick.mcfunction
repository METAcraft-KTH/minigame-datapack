## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function spleef:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function spleef:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function spleef:states/lobby/respawn

# increment timer
scoreboard players add ?timer spleef.game 1
# calculate remaining time
scoreboard players operation #remainingseconds spleef.game = time.lobby spleef.config
scoreboard players operation #remainingseconds spleef.game -= ?timer spleef.game
scoreboard players operation #remainingseconds spleef.game /= 20 GLOBAL
scoreboard players operation #displayminutes spleef.game = #remainingseconds spleef.game
scoreboard players operation #displayminutes spleef.game /= 60 GLOBAL
scoreboard players operation #displayseconds spleef.game = #remainingseconds spleef.game
scoreboard players operation #displayseconds spleef.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds spleef.game matches ..9 run bossbar set spleef:timer name [{"score": {"name": "#displayminutes","objective": "spleef.game"}},":0",{"score": {"name": "#displayseconds","objective": "spleef.game"}}," until Color Spleef begins"]
execute if score #displayseconds spleef.game matches 10.. run bossbar set spleef:timer name [{"score": {"name": "#displayminutes","objective": "spleef.game"}},":",{"score": {"name": "#displayseconds","objective": "spleef.game"}}," until Color Spleef begins"]
execute store result bossbar spleef:timer value run scoreboard players get ?timer spleef.game

## start game
execute if score ?timer spleef.game >= time.lobby spleef.config run function spleef:states/pregame/start