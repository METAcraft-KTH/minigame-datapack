## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function atc:states/ingame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function atc:states/ingame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function atc:states/ingame/respawn

# increment timer
scoreboard players add ?timer atc.game 1
# calculate remaining time
scoreboard players operation #remainingseconds atc.game = time.ingame atc.config
scoreboard players operation #remainingseconds atc.game -= ?timer atc.game
scoreboard players operation #remainingseconds atc.game /= 20 GLOBAL
scoreboard players operation #displayminutes atc.game = #remainingseconds atc.game
scoreboard players operation #displayminutes atc.game /= 60 GLOBAL
scoreboard players operation #displayseconds atc.game = #remainingseconds atc.game
scoreboard players operation #displayseconds atc.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds atc.game matches ..9 run bossbar set atc:timer name {"text": "Among the Crowd ends in ", "color": "yellow", "extra": [{"score": {"name": "#displayminutes","objective": "atc.game"}},":0",{"score": {"name": "#displayseconds","objective": "atc.game"}}]}
execute if score #displayseconds atc.game matches 10.. run bossbar set atc:timer name {"text": "Among the Crowd ends in ", "color": "yellow", "extra": [{"score": {"name": "#displayminutes","objective": "atc.game"}},":",{"score": {"name": "#displayseconds","objective": "atc.game"}}]}
execute store result bossbar atc:timer value run scoreboard players get ?timer atc.game

execute if stopwatch atc:pointticker 1.. run function atc:states/ingame/z/tick_second

execute as @e[type=metacraft:player, tag=atc.fake_player] at @s rotated as @s run function atc:states/ingame/tick_fake_player

## end game
execute store result score #hiders atc.game if entity @a[team=atc.hiders]
execute if score #hiders atc.game matches 0 run return run function atc:states/postgame/start
execute if score ?timer atc.game >= time.ingame atc.config run function atc:states/postgame/start
