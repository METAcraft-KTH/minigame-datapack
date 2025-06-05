## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function spleef:states/ingame_freeze/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function spleef:states/ingame_freeze/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function spleef:states/ingame_freeze/respawn

# increment timer
scoreboard players add ?timer spleef.game 1
# display round number
bossbar set spleef:timer name ["PauseChamp... (",{"score": {"name": "?round.number","objective": "spleef.game"}},"/10)"]

# title
title @a times 0 10 0
title @a title ""
title @a subtitle ""

# kill players who fall off
execute at @n[type=marker,tag=spleef.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~
execute as @a[tag=!admin,scores={spleef.Y=..0}] run kill @s

# clear everyone's HUNGER!! (and no punching)
effect clear @a[tag=!admin] hunger
effect give @a[tag=!admin] weakness 1 1 true

## end game
execute if score ?timer spleef.game >= time.ingame_freeze spleef.config as @a[tag=!admin,gamemode=!spectator] run function score:add_points {points:30}
execute if score ?timer spleef.game >= time.ingame_freeze spleef.config as @a[tag=!admin,gamemode=!spectator] run function spleef:states/ingame_freeze/points_for_surviving
execute if score ?timer spleef.game >= time.ingame_freeze spleef.config if score ?round.number spleef.game matches ..12 run function spleef:states/ingame_spleef/start
execute if score ?timer spleef.game >= time.ingame_freeze spleef.config if score ?round.number spleef.game matches 13.. run function spleef:states/postgame/start