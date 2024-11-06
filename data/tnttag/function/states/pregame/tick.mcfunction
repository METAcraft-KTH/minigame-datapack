## PREGAME: Players have just TPed from the lobby to the arena. Maybe run a cutscene and/or display game instructions

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tnttag:states/pregame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tnttag:states/pregame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tnttag:states/pregame/respawn

# increment timer
scoreboard players add ?timer tnttag.game 1
# calculate remaining time
scoreboard players operation #remainingseconds tnttag.game = time.pregame tnttag.config
scoreboard players operation #remainingseconds tnttag.game -= ?timer tnttag.game
scoreboard players operation #remainingseconds tnttag.game /= 20 GLOBAL
scoreboard players operation #displayminutes tnttag.game = #remainingseconds tnttag.game
scoreboard players operation #displayminutes tnttag.game /= 60 GLOBAL
scoreboard players operation #displayseconds tnttag.game = #remainingseconds tnttag.game
scoreboard players operation #displayseconds tnttag.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds tnttag.game matches ..9 run bossbar set tnttag:timer name ["Intro ",{"score": {"name": "#displayminutes","objective": "tnttag.game"}},":0",{"score": {"name": "#displayseconds","objective": "tnttag.game"}}]
execute if score #displayseconds tnttag.game matches 10.. run bossbar set tnttag:timer name ["Intro ",{"score": {"name": "#displayminutes","objective": "tnttag.game"}},":",{"score": {"name": "#displayseconds","objective": "tnttag.game"}}]
execute store result bossbar tnttag:timer value run scoreboard players get ?timer tnttag.game

## start game (for real)
execute if score ?timer tnttag.game >= time.pregame tnttag.config run function tnttag:states/ingame/start