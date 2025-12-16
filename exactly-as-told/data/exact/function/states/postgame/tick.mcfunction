## POSTGAME: The game has ended, and players will be teleported back soon.

# manage rejoin etc (you should prob not be able to die in this phase)
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function exact:states/postgame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function exact:states/postgame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function exact:states/postgame/respawn

# increment timer
scoreboard players add ?timer exact.game 1
# calculate remaining time
scoreboard players operation #remainingseconds exact.game = time.postgame exact.config
scoreboard players operation #remainingseconds exact.game -= ?timer exact.game
scoreboard players operation #remainingseconds exact.game /= 20 GLOBAL
scoreboard players operation #displayminutes exact.game = #remainingseconds exact.game
scoreboard players operation #displayminutes exact.game /= 60 GLOBAL
scoreboard players operation #displayseconds exact.game = #remainingseconds exact.game
scoreboard players operation #displayseconds exact.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds exact.game matches ..9 run bossbar set exact:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "exact.game"}},":0",{"score": {"name": "#displayseconds","objective": "exact.game"}}]
execute if score #displayseconds exact.game matches 10.. run bossbar set exact:timer name ["Returning to lobby in ",{"score": {"name": "#displayminutes","objective": "exact.game"}},":",{"score": {"name": "#displayseconds","objective": "exact.game"}}]
execute store result bossbar exact:timer value run scoreboard players get ?timer exact.game

execute as @a if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:59}}}}} run tp @s @n[tag=exact.tp.arena]

## return to lobby
execute if score ?timer exact.game >= time.postgame exact.config run function exact:exit