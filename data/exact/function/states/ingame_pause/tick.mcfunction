## INGAME PHASE: The game has begun, and people are playing
execute if score ?round.number exact.game matches 5 run return run function exact:states/postgame/start

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function exact:states/ingame_pause/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function exact:states/ingame_pause/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function exact:states/ingame_pause/respawn

# increment timer
scoreboard players add ?timer exact.game 1
# calculate remaining time
scoreboard players operation #remainingseconds exact.game = time.ingame_pause exact.config
scoreboard players operation #remainingseconds exact.game -= ?timer exact.game
scoreboard players operation #remainingseconds exact.game /= 20 GLOBAL
scoreboard players operation #displayminutes exact.game = #remainingseconds exact.game
scoreboard players operation #displayminutes exact.game /= 60 GLOBAL
scoreboard players operation #displayseconds exact.game = #remainingseconds exact.game
scoreboard players operation #displayseconds exact.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds exact.game matches ..9 run bossbar set exact:timer name ["Next map in ",{"score": {"name": "#displayminutes","objective": "exact.game"}},":0",{"score": {"name": "#displayseconds","objective": "exact.game"}}]
execute if score #displayseconds exact.game matches 10.. run bossbar set exact:timer name ["Next map in ",{"score": {"name": "#displayminutes","objective": "exact.game"}},":",{"score": {"name": "#displayseconds","objective": "exact.game"}}]
execute store result bossbar exact:timer value run scoreboard players get ?timer exact.game

## end game
execute if score ?timer exact.game >= time.ingame_pause exact.config run function exact:states/ingame_pause/end