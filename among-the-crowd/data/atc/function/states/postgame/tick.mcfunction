## POSTGAME: The game has ended, and players will be teleported back soon.

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function atc:states/postgame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function atc:states/postgame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function atc:states/postgame/respawn

# increment timer
scoreboard players add ?timer atc.game 1
# calculate remaining time
scoreboard players operation #remainingseconds atc.game = time.postgame atc.config
scoreboard players operation #remainingseconds atc.game -= ?timer atc.game
scoreboard players operation #remainingseconds atc.game /= 20 GLOBAL
scoreboard players operation #displayminutes atc.game = #remainingseconds atc.game
scoreboard players operation #displayminutes atc.game /= 60 GLOBAL
scoreboard players operation #displayseconds atc.game = #remainingseconds atc.game
scoreboard players operation #displayseconds atc.game %= 60 GLOBAL

execute unless score #round atc.game >= round_count atc.config run return run function atc:states/postgame/tick_next_round

# display remaining time
execute if score #displayseconds atc.game matches ..9 run bossbar set atc:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "atc.game"}},":0",{"score": {"name": "#displayseconds","objective": "atc.game"}}]
execute if score #displayseconds atc.game matches 10.. run bossbar set atc:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "atc.game"}},":",{"score": {"name": "#displayseconds","objective": "atc.game"}}]
execute store result bossbar atc:timer value run scoreboard players get ?timer atc.game

## return to lobby
execute if score ?timer atc.game >= time.postgame atc.config run function atc:exit
