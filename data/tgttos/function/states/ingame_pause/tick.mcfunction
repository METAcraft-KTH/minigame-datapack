## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function tgttos:states/ingame_pause/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function tgttos:states/ingame_pause/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function tgttos:states/ingame_pause/respawn

# increment timer
scoreboard players add ?timer tgttos.game 1
# display round number
bossbar set tgttos:timer name ["PauseChamp... (",{"score": {"name": "?round.number","objective": "tgttos.game"}},"/10)"]

# title
title @a times 0 10 0
title @a title ""
title @a subtitle ""

# kill players who fall off
execute at @n[type=marker,tag=tgttos.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~
execute as @a[tag=!admin,scores={tgttos.Y=..0}] run kill @s

# clear everyone's HUNGER!! (and no punching)
effect clear @a[tag=!admin] hunger
effect give @a[tag=!admin] weakness 1 1 true

## end game

execute if score ?timer tgttos.game >= time.ingame_pause tgttos.config store result score #playersleft tgttos.game if entity @a[tag=!admin,gamemode=adventure]
execute if score ?timer tgttos.game >= time.ingame_pause tgttos.config as @a[tag=!admin,gamemode=!spectator] run function tgttos:states/ingame_pause/points_for_surviving
execute if score ?timer tgttos.game >= time.ingame_pause tgttos.config if score ?round.number tgttos.game matches ..12 run function tgttos:states/ingame_tgttos/start
execute if score ?timer tgttos.game >= time.ingame_pause tgttos.config if score ?round.number tgttos.game matches 13.. run function tgttos:states/postgame/start