## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function koth:states/ingame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function koth:states/ingame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function koth:states/ingame/respawn

# increment timer
scoreboard players add ?timer koth.game 1
# calculate remaining time
scoreboard players operation #remainingseconds koth.game = time.ingame koth.config
scoreboard players operation #remainingseconds koth.game -= ?timer koth.game
scoreboard players operation #remainingseconds koth.game /= 20 GLOBAL
scoreboard players operation #displayminutes koth.game = #remainingseconds koth.game
scoreboard players operation #displayminutes koth.game /= 60 GLOBAL
scoreboard players operation #displayseconds koth.game = #remainingseconds koth.game
scoreboard players operation #displayseconds koth.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds koth.game matches ..9 run bossbar set koth:timer name ["koth ends in ",{"score": {"name": "#displayminutes","objective": "koth.game"}},":0",{"score": {"name": "#displayseconds","objective": "koth.game"}}]
execute if score #displayseconds koth.game matches 10.. run bossbar set koth:timer name ["koth ends in ",{"score": {"name": "#displayminutes","objective": "koth.game"}},":",{"score": {"name": "#displayseconds","objective": "koth.game"}}]
execute store result bossbar koth:timer value run scoreboard players get ?timer koth.game

## end game
execute if score ?timer koth.game >= time.ingame koth.config run function koth:states/postgame/start