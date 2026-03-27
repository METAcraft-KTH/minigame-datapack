## PREGAME: Players have just TPed from the lobby to the arena. Maybe run a cutscene and/or display game instructions

# increment timer
scoreboard players add ?timer spleef.game 1
# calculate remaining time
scoreboard players operation #remainingseconds spleef.game = time.pregame spleef.config
scoreboard players operation #remainingseconds spleef.game -= ?timer spleef.game
scoreboard players operation #remainingseconds spleef.game /= #20 main.const
scoreboard players operation #displayminutes spleef.game = #remainingseconds spleef.game
scoreboard players operation #displayminutes spleef.game /= #60 main.const
scoreboard players operation #displayseconds spleef.game = #remainingseconds spleef.game
scoreboard players operation #displayseconds spleef.game %= #60 main.const
title @a[tag=!admin] actionbar ["Receiving pickaxe in ",{"score": {"name": "#displayminutes","objective": "spleef.game"}},":",{"score": {"name": "#displayseconds","objective": "spleef.game"}}]

# tp players back onto the platform
execute as @a[tag=!admin,scores={spleef.Y=..0}] run tellraw @s {"text":"Whoa, hey, you don't wanna do that.","color":"gray"}
execute as @a[tag=!admin,scores={spleef.Y=..0}] at @s run tp @s @n[tag=spleef.tp.arena,type=marker,distance=..1000]


## start game (for real)
scoreboard players operation #remainingtime spleef.game = time.pregame spleef.config
scoreboard players operation #remainingtime spleef.game -= ?timer spleef.game
title @a[tag=!admin] times 0 25 20
execute if score #remainingtime spleef.game matches 80 run title @a[tag=!admin] title {"text":"3","color":"green"}
execute if score #remainingtime spleef.game matches 80 run title @a[tag=!admin] subtitle ""
execute if score #remainingtime spleef.game matches 80 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime spleef.game matches 60 run title @a[tag=!admin] title {"text":"2","color":"green"}
execute if score #remainingtime spleef.game matches 60 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime spleef.game matches 40 run title @a[tag=!admin] title {"text":"1","color":"green"}
execute if score #remainingtime spleef.game matches 40 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~
execute if score #remainingtime spleef.game matches 20 run title @a[tag=!admin] title {"text":"0?","color":"green"}
execute if score #remainingtime spleef.game matches 20 as @a[tag=!admin] at @s run playsound block.note_block.pling player @s ~ ~ ~

execute if score ?timer spleef.game >= time.pregame spleef.config as @a run function spleefmusic:sans/stop
execute if score ?timer spleef.game >= time.pregame spleef.config run function spleef:states/ingame_spleef/start