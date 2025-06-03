## PREGAME: Players have just TPed from the lobby to the arena. Maybe run a cutscene and/or display game instructions

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function koth:states/pregame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function koth:states/pregame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function koth:states/pregame/respawn

# increment timer
scoreboard players add ?timer koth.game 1
# calculate remaining time
scoreboard players operation #remainingseconds koth.game = time.pregame koth.config
scoreboard players operation #remainingseconds koth.game -= ?timer koth.game
scoreboard players operation #remainingseconds koth.game /= 20 GLOBAL
scoreboard players operation #displayminutes koth.game = #remainingseconds koth.game
scoreboard players operation #displayminutes koth.game /= 60 GLOBAL
scoreboard players operation #displayseconds koth.game = #remainingseconds koth.game
scoreboard players operation #displayseconds koth.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds koth.game matches ..9 run bossbar set koth:timer name ["Intro ",{"score": {"name": "#displayminutes","objective": "koth.game"}},":0",{"score": {"name": "#displayseconds","objective": "koth.game"}}]
execute if score #displayseconds koth.game matches 10.. run bossbar set koth:timer name ["Intro ",{"score": {"name": "#displayminutes","objective": "koth.game"}},":",{"score": {"name": "#displayseconds","objective": "koth.game"}}]
execute store result bossbar koth:timer value run scoreboard players get ?timer koth.game

## start game (for real)
execute if score ?timer koth.game >= time.pregame koth.config run function koth:states/ingame/start