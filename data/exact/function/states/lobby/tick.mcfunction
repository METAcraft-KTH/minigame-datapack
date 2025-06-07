## LOBBY PHASE: Players are still in the Campus lobby.

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function exact:states/lobby/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function exact:states/lobby/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function exact:states/lobby/respawn

# increment timer
scoreboard players add ?timer exact.game 1
# calculate remaining time
scoreboard players operation #remainingseconds exact.game = time.lobby exact.config
scoreboard players operation #remainingseconds exact.game -= ?timer exact.game
scoreboard players operation #remainingseconds exact.game /= 20 GLOBAL
scoreboard players operation #displayminutes exact.game = #remainingseconds exact.game
scoreboard players operation #displayminutes exact.game /= 60 GLOBAL
scoreboard players operation #displayseconds exact.game = #remainingseconds exact.game
scoreboard players operation #displayseconds exact.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds exact.game matches ..9 run bossbar set exact:timer name [{"score": {"name": "#displayminutes","objective": "exact.game"}},":0",{"score": {"name": "#displayseconds","objective": "exact.game"}}," until MINECRAFT HEXATHLON 3 begins"]
execute if score #displayseconds exact.game matches 10.. run bossbar set exact:timer name [{"score": {"name": "#displayminutes","objective": "exact.game"}},":",{"score": {"name": "#displayseconds","objective": "exact.game"}}," until MINECRAFT HEXATHLON 3 begins"]
execute store result bossbar exact:timer value run scoreboard players get ?timer exact.game

effect give @a resistance infinite 5 true
effect give @a saturation infinite 5 true

## start game
execute if score ?timer exact.game >= time.lobby exact.config run scoreboard players set ?round.number exact.game 1
execute if score ?timer exact.game >= time.lobby exact.config run tag @e[type=marker,tag=exact.tp.1] add exact.tp.arena
execute if score ?timer exact.game >= time.lobby exact.config run function exact:states/pregame/start