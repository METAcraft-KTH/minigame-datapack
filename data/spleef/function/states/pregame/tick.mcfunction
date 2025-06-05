## PREGAME: Players have just TPed from the lobby to the arena. Maybe run a cutscene and/or display game instructions

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function spleef:states/pregame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function spleef:states/pregame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function spleef:states/pregame/respawn

# increment timer
scoreboard players add ?timer spleef.game 1
# calculate remaining time
scoreboard players operation #remainingseconds spleef.game = time.pregame spleef.config
scoreboard players operation #remainingseconds spleef.game -= ?timer spleef.game
scoreboard players operation #remainingseconds spleef.game /= 20 GLOBAL
scoreboard players operation #displayminutes spleef.game = #remainingseconds spleef.game
scoreboard players operation #displayminutes spleef.game /= 60 GLOBAL
scoreboard players operation #displayseconds spleef.game = #remainingseconds spleef.game
scoreboard players operation #displayseconds spleef.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds spleef.game matches ..9 run bossbar set spleef:timer name ["Receiving pickaxe in ",{"score": {"name": "#displayminutes","objective": "spleef.game"}},":0",{"score": {"name": "#displayseconds","objective": "spleef.game"}}]
execute if score #displayseconds spleef.game matches 10.. run bossbar set spleef:timer name ["Receiving pickaxe in ",{"score": {"name": "#displayminutes","objective": "spleef.game"}},":",{"score": {"name": "#displayseconds","objective": "spleef.game"}}]
execute store result bossbar spleef:timer value run scoreboard players get ?timer spleef.game

# tp players back onto the platform
execute as @a[tag=!admin] at @s store result score @s spleef.Y run data get entity @s Pos[1] 1
execute as @a[tag=!admin,scores={spleef.Y=..0}] run tellraw @s {"text":"Whoa, hey, you don't wanna do that.","color":"gray"}
execute as @a[tag=!admin,scores={spleef.Y=..0}] at @s run tp @s @n[tag=spleef.tp.arena,type=marker,distance=..1000]

# fill offhand w wind charges
item replace entity @a[tag=!admin] weapon.offhand with wind_charge[use_cooldown={seconds:1.0f}]

## start game (for real)
execute if score ?timer spleef.game >= time.pregame spleef.config run function spleef:states/ingame/start