## POSTGAME: The game has ended, and players will be teleported back soon.

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function ttag:states/postgame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function ttag:states/postgame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function ttag:states/postgame/respawn

# increment timer
scoreboard players add ?timer ttag.game 1
# calculate remaining time
scoreboard players operation #remainingseconds ttag.game = time.postgame ttag.config
scoreboard players operation #remainingseconds ttag.game -= ?timer ttag.game
scoreboard players operation #remainingseconds ttag.game /= 20 GLOBAL
scoreboard players operation #displayminutes ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayminutes ttag.game /= 60 GLOBAL
scoreboard players operation #displayseconds ttag.game = #remainingseconds ttag.game
scoreboard players operation #displayseconds ttag.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds ttag.game matches ..9 run bossbar set ttag:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":0",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute if score #displayseconds ttag.game matches 10.. run bossbar set ttag:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "ttag.game"}},":",{"score": {"name": "#displayseconds","objective": "ttag.game"}}]
execute store result bossbar ttag:timer value run scoreboard players get ?timer ttag.game

## return to lobby
execute if score ?timer ttag.game >= time.postgame ttag.config run function ttag:exit