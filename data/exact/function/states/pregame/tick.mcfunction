## PREGAME: Players have just TPed from the lobby to the arena. Maybe run a cutscene and/or display game instructions

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function exact:states/pregame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function exact:states/pregame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function exact:states/pregame/respawn

# increment timer
scoreboard players add ?timer exact.game 1
# calculate remaining time
scoreboard players operation #remainingseconds exact.game = time.pregame exact.config
scoreboard players operation #remainingseconds exact.game -= ?timer exact.game
scoreboard players operation #remainingseconds exact.game /= 20 GLOBAL
scoreboard players operation #displayminutes exact.game = #remainingseconds exact.game
scoreboard players operation #displayminutes exact.game /= 60 GLOBAL
scoreboard players operation #displayseconds exact.game = #remainingseconds exact.game
scoreboard players operation #displayseconds exact.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds exact.game matches ..9 run bossbar set exact:timer name ["Chaos begins in ",{"score": {"name": "#displayminutes","objective": "exact.game"}},":0",{"score": {"name": "#displayseconds","objective": "exact.game"}}]
execute if score #displayseconds exact.game matches 10.. run bossbar set exact:timer name ["Chaos begins in ",{"score": {"name": "#displayminutes","objective": "exact.game"}},":",{"score": {"name": "#displayseconds","objective": "exact.game"}}]
execute store result bossbar exact:timer value run scoreboard players get ?timer exact.game

effect give @a[tag=!admin] saturation infinite 0 true
effect give @a[tag=!admin] resistance infinite 4 true

execute at @n[type=marker,tag=exact.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~ ~

## start game (for real)
scoreboard players operation #remainingtime exact.game = time.pregame exact.config
scoreboard players operation #remainingtime exact.game -= ?timer exact.game
title @a[tag=!admin] times 0 40 20
execute if score #remainingtime exact.game matches 120 run title @a[tag=!admin] title {"text":"5","color":"green"}
execute if score #remainingtime exact.game matches 120 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime exact.game matches 100 run title @a[tag=!admin] title {"text":"4","color":"green"}
execute if score #remainingtime exact.game matches 100 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime exact.game matches 80 run title @a[tag=!admin] title {"text":"3","color":"green"}
execute if score #remainingtime exact.game matches 80 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime exact.game matches 60 run title @a[tag=!admin] title {"text":"2","color":"green"}
execute if score #remainingtime exact.game matches 60 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime exact.game matches 40 run title @a[tag=!admin] title {"text":"1","color":"green"}
execute if score #remainingtime exact.game matches 40 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime exact.game matches 20 run title @a[tag=!admin] title {"text":"0?","color":"green"}
execute if score #remainingtime exact.game matches 20 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~

execute if score ?timer exact.game >= time.pregame exact.config run function exact:states/ingame_run/start