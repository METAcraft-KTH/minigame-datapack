## PREGAME: Players have just TPed from the lobby to the arena. Maybe run a cutscene and/or display game instructions

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tnt:states/pregame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tnt:states/pregame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tnt:states/pregame/respawn

# increment timer
scoreboard players add ?timer tnt.game 1
# calculate remaining time
scoreboard players operation #remainingseconds tnt.game = time.pregame tnt.config
scoreboard players operation #remainingseconds tnt.game -= ?timer tnt.game
scoreboard players operation #remainingseconds tnt.game /= 20 GLOBAL
scoreboard players operation #displayminutes tnt.game = #remainingseconds tnt.game
scoreboard players operation #displayminutes tnt.game /= 60 GLOBAL
scoreboard players operation #displayseconds tnt.game = #remainingseconds tnt.game
scoreboard players operation #displayseconds tnt.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds tnt.game matches ..9 run bossbar set tnt:timer name ["Intro ",{"score": {"name": "#displayminutes","objective": "tnt.game"}},":0",{"score": {"name": "#displayseconds","objective": "tnt.game"}}]
execute if score #displayseconds tnt.game matches 10.. run bossbar set tnt:timer name ["Intro ",{"score": {"name": "#displayminutes","objective": "tnt.game"}},":",{"score": {"name": "#displayseconds","objective": "tnt.game"}}]
execute store result bossbar tnt:timer value run scoreboard players get ?timer tnt.game

## start game (for real)
execute if score ?timer tnt.game >= time.pregame tnt.config run function tnt:states/ingame/start