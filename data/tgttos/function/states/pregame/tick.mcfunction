## PREGAME: Players have just TPed from the lobby to the arena. Maybe run a cutscene and/or display game instructions

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tgttos:states/pregame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tgttos:states/pregame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tgttos:states/pregame/respawn

# increment timer
scoreboard players add ?timer tgttos.game 1
# calculate remaining time
scoreboard players operation #remainingseconds tgttos.game = time.pregame tgttos.config
scoreboard players operation #remainingseconds tgttos.game -= ?timer tgttos.game
scoreboard players operation #remainingseconds tgttos.game /= 20 GLOBAL
scoreboard players operation #displayminutes tgttos.game = #remainingseconds tgttos.game
scoreboard players operation #displayminutes tgttos.game /= 60 GLOBAL
scoreboard players operation #displayseconds tgttos.game = #remainingseconds tgttos.game
scoreboard players operation #displayseconds tgttos.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds tgttos.game matches ..9 run bossbar set tgttos:timer name ["Chaos begins in ",{"score": {"name": "#displayminutes","objective": "tgttos.game"}},":0",{"score": {"name": "#displayseconds","objective": "tgttos.game"}}]
execute if score #displayseconds tgttos.game matches 10.. run bossbar set tgttos:timer name ["Chaos begins in ",{"score": {"name": "#displayminutes","objective": "tgttos.game"}},":",{"score": {"name": "#displayseconds","objective": "tgttos.game"}}]
execute store result bossbar tgttos:timer value run scoreboard players get ?timer tgttos.game

## start game (for real)
scoreboard players operation #remainingtime tgttos.game = time.pregame tgttos.config
scoreboard players operation #remainingtime tgttos.game -= ?timer tgttos.game
title @a[tag=!admin] times 0 25 20
execute if score #remainingtime tgttos.game matches 120 run title @a[tag=!admin] title {"text":"5","color":"green"}
execute if score #remainingtime tgttos.game matches 120 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 100 run title @a[tag=!admin] title {"text":"4","color":"green"}
execute if score #remainingtime tgttos.game matches 100 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 80 run title @a[tag=!admin] title {"text":"3","color":"green"}
execute if score #remainingtime tgttos.game matches 80 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 60 run title @a[tag=!admin] title {"text":"2","color":"green"}
execute if score #remainingtime tgttos.game matches 60 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 40 run title @a[tag=!admin] title {"text":"1","color":"green"}
execute if score #remainingtime tgttos.game matches 40 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime tgttos.game matches 20 run title @a[tag=!admin] title {"text":"0?","color":"green"}
execute if score #remainingtime tgttos.game matches 20 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~

execute if score ?timer tgttos.game >= time.pregame tgttos.config run title @a title {"text":"MOVE!","color":"gold"}
execute if score ?timer tgttos.game >= time.pregame tgttos.config at @n[tag=tgttos.tp.arena] run fill ~ ~ ~
execute if score ?timer tgttos.game >= time.pregame tgttos.config run function tgttos:states/ingame_run/start