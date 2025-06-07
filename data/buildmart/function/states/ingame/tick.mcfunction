from buildmart:lib import getItems

## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function buildmart:states/ingame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function buildmart:states/ingame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function buildmart:states/ingame/respawn

# increment timer
scoreboard players add ?timer buildmart.game 1
# calculate remaining time
scoreboard players operation #remainingseconds buildmart.game = time.ingame buildmart.config
scoreboard players operation #remainingseconds buildmart.game -= ?timer buildmart.game
scoreboard players operation #remainingseconds buildmart.game /= 20 GLOBAL
scoreboard players operation #displayminutes buildmart.game = #remainingseconds buildmart.game
scoreboard players operation #displayminutes buildmart.game /= 60 GLOBAL
scoreboard players operation #displayseconds buildmart.game = #remainingseconds buildmart.game
scoreboard players operation #displayseconds buildmart.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds buildmart.game matches ..9 run bossbar set buildmart:timer name ["First we mine, then we craft ends in ",{"score": {"name": "#displayminutes","objective": "buildmart.game"}},":0",{"score": {"name": "#displayseconds","objective": "buildmart.game"}}]
execute if score #displayseconds buildmart.game matches 10.. run bossbar set buildmart:timer name ["First we mine, then we craft ends in ",{"score": {"name": "#displayminutes","objective": "buildmart.game"}},":",{"score": {"name": "#displayseconds","objective": "buildmart.game"}}]
execute store result bossbar buildmart:timer value run scoreboard players get ?timer buildmart.game

## end game
execute if score ?timer buildmart.game >= time.ingame buildmart.config run function buildmart:states/postgame/start


execute as @e[scores={buildmart.display_index=-2147483648..2147483647}] at @s rotated as @s:
	for item in getItems():
		itemTag = item.replace(":", ".")
		execute if entity @s[tag=itemTag] positioned ^ ^ ^0.5 as @a[tag=itemTag,distance=..50] run particle minecraft:block_marker{block_state:barrier} ~ ~ ~ 0 0 0 1 1 force @s



execute as @a[tag=!admin] at @s as @e[type=chicken,distance=..10]:
	execute store result score #egglaytime buildmart.game run data get entity @s EggLayTime
	execute if score #egglaytime buildmart.game > chicken_egg_time buildmart.config store result entity @s EggLayTime int 1 run scoreboard players get chicken_egg_time buildmart.config
