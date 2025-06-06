## INGAME_CP PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function koth:states/ingame_cp/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function koth:states/ingame_cp/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function koth:states/ingame_cp/respawn

# increment timer
scoreboard players add ?timer koth.game 1
# calculate remaining time
scoreboard players operation #remainingseconds koth.game = time.ingame_cp koth.config
scoreboard players operation #remainingseconds koth.game -= ?timer koth.game
scoreboard players operation #remainingseconds koth.game /= 20 GLOBAL
scoreboard players operation #displayminutes koth.game = #remainingseconds koth.game
scoreboard players operation #displayminutes koth.game /= 60 GLOBAL
scoreboard players operation #displayseconds koth.game = #remainingseconds koth.game
scoreboard players operation #displayseconds koth.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds koth.game matches ..9 run bossbar set koth:timer name ["Time remaining is ",{"score": {"name": "#displayminutes","objective": "koth.game"}},":0",{"score": {"name": "#displayseconds","objective": "koth.game"}}]
execute if score #displayseconds koth.game matches 10.. run bossbar set koth:timer name ["Time remaining is ",{"score": {"name": "#displayminutes","objective": "koth.game"}},":",{"score": {"name": "#displayseconds","objective": "koth.game"}}]
execute store result bossbar koth:timer value run scoreboard players get ?timer koth.game

## end game
execute if score ?timer koth.game >= time.ingame_cp koth.config run function koth:states/postgame/start

# Control points are now enabled!
execute as @e[tag=koth.cp] at @s rotated as @s run function koth:cp/tick

scoreboard players set line1 koth.display 1
scoreboard players display name line1 koth.display [{"text": "Blue: "}, {"score": {"name": "blue", "objective": "koth.cp"}}]
scoreboard players display name line2 koth.display [{"text": "Red: "}, {"score": {"name": "red", "objective": "koth.cp"}}]
scoreboard players display name line3 koth.display [{"text":""}]
scoreboard players display name line4 koth.display [{"text":"North-East: "}, {"score": {"name": "@e[tag=koth.cp.ne]", "objective": "koth.cp"}}]
scoreboard players display name line5 koth.display [{"text":"Center: "}, {"score": {"name": "@e[tag=koth.cp.center]", "objective": "koth.cp"}}]
scoreboard players display name line6 koth.display [{"text":"South-West: "}, {"score": {"name": "@e[tag=koth.cp.sw]", "objective": "koth.cp"}}]
