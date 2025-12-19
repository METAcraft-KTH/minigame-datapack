## PREGAME: Players have just TPed from the lobby to the arena. Maybe run a cutscene and/or display game instructions

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function survivalgames:states/pregame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function survivalgames:states/pregame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function survivalgames:states/pregame/respawn

# increment timer
scoreboard players add ?timer SURVIVALGAMES.game 1
# calculate remaining time
scoreboard players operation #remainingseconds SURVIVALGAMES.game = time.pregame SURVIVALGAMES.config
scoreboard players operation #remainingseconds SURVIVALGAMES.game -= ?timer SURVIVALGAMES.game
scoreboard players operation #remainingseconds SURVIVALGAMES.game /= 20 GLOBAL
scoreboard players operation #displayminutes SURVIVALGAMES.game = #remainingseconds SURVIVALGAMES.game
scoreboard players operation #displayminutes SURVIVALGAMES.game /= 60 GLOBAL
scoreboard players operation #displayseconds SURVIVALGAMES.game = #remainingseconds SURVIVALGAMES.game
scoreboard players operation #displayseconds SURVIVALGAMES.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds SURVIVALGAMES.game matches ..9 run bossbar set survivalgames:timer name ["Intro ",{"score": {"name": "#displayminutes","objective": "SURVIVALGAMES.game"}},":0",{"score": {"name": "#displayseconds","objective": "SURVIVALGAMES.game"}}]
execute if score #displayseconds SURVIVALGAMES.game matches 10.. run bossbar set survivalgames:timer name ["Intro ",{"score": {"name": "#displayminutes","objective": "SURVIVALGAMES.game"}},":",{"score": {"name": "#displayseconds","objective": "SURVIVALGAMES.game"}}]
execute store result bossbar survivalgames:timer value run scoreboard players get ?timer SURVIVALGAMES.game

## start game (for real)
execute if score ?timer SURVIVALGAMES.game >= time.pregame SURVIVALGAMES.config run function survivalgames:states/ingame/start


execute as @e[tag=SURVIVALGAMES.starting_point] at @s run tp @p[tag=!admin,distance=..2] ~ ~ ~
