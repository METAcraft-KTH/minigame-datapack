## INGAME PHASE: The game has begun, and people are playing
execute if score ?round.number exact.game matches 15 run return run function exact:states/postgame/start

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function exact:states/ingame_pause/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function exact:states/ingame_pause/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function exact:states/ingame_pause/respawn

# increment timer
scoreboard players add ?timer exact.game 1
# calculate remaining time
scoreboard players operation #remainingseconds exact.game = time.ingame_pause exact.config
scoreboard players operation #remainingseconds exact.game -= ?timer exact.game
scoreboard players operation #remainingseconds exact.game /= 20 GLOBAL
scoreboard players operation #displayminutes exact.game = #remainingseconds exact.game
scoreboard players operation #displayminutes exact.game /= 60 GLOBAL
scoreboard players operation #displayseconds exact.game = #remainingseconds exact.game
scoreboard players operation #displayseconds exact.game %= 60 GLOBAL
# display remaining time
bossbar set exact:timer name ["Awaiting next instructions... "]
bossbar set exact:timer value 0

execute as @a if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:59}}}}} run tp @s @n[tag=exact.tp.arena]

## end game
execute if score ?timer exact.game >= time.ingame_pause exact.config run function exact:states/ingame_pause/end