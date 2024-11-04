## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function hh:states/ingame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function hh:states/ingame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function hh:states/ingame/respawn

# increment timer
scoreboard players add ?timer hh.game 1
# calculate remaining time
scoreboard players operation #remainingseconds hh.game = time.ingame hh.config
scoreboard players operation #remainingseconds hh.game -= ?timer hh.game
scoreboard players operation #remainingseconds hh.game /= 20 GLOBAL
scoreboard players operation #displayminutes hh.game = #remainingseconds hh.game
scoreboard players operation #displayminutes hh.game /= 60 GLOBAL
scoreboard players operation #displayseconds hh.game = #remainingseconds hh.game
scoreboard players operation #displayseconds hh.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds hh.game matches ..9 run bossbar set hh:timer name ["hh ends in ",{"score": {"name": "#displayminutes","objective": "hh.game"}},":0",{"score": {"name": "#displayseconds","objective": "hh.game"}}]
execute if score #displayseconds hh.game matches 10.. run bossbar set hh:timer name ["hh ends in ",{"score": {"name": "#displayminutes","objective": "hh.game"}},":",{"score": {"name": "#displayseconds","objective": "hh.game"}}]
execute store result bossbar hh:timer value run scoreboard players get ?timer hh.game

## end game
execute if score ?timer hh.game >= time.ingame hh.config run function hh:states/postgame/start

## Skipping
execute as @a if score @s hh.checkpointDeaths matches 3.. run function hh:states/ingame/allow_skipping
execute as @a unless score @s hh.checkpointDeaths matches 3.. run function hh:states/ingame/disallow_skipping
execute as @a if score @s hh.skip matches 1 run function hh:states/ingame/skip