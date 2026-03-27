## INGAME PHASE: The game has begun, and people are playing

# increment timer
scoreboard players add ?timer spleef.game 1
# display round number
title @a[tag=!admin] actionbar ["PauseChamp... (",{"score": {"name": "?round.number","objective": "spleef.game"}},"/13)"]

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

# remove blocks
execute if score ?timer spleef.game matches 1 run function spleef:utility/map/destroy
execute if score ?timer spleef.game matches 2 run function spleef:utility/map/destroy_1
execute if score ?timer spleef.game matches 3 run function spleef:utility/map/destroy_2
execute if score ?timer spleef.game matches 4 run function spleef:utility/map/destroy_3
execute if score ?timer spleef.game matches 5 run function spleef:utility/map/destroy_4
execute if score ?timer spleef.game matches 6 run function spleef:utility/map/destroy_5
execute if score ?timer spleef.game matches 7 run function spleef:utility/map/destroy_6

## end game

execute if score ?timer spleef.game >= time.ingame_freeze spleef.config store result score #playersleft spleef.game if entity @a[tag=!admin,gamemode=adventure]
execute if score ?timer spleef.game >= time.ingame_freeze spleef.config as @a[tag=!admin,gamemode=!spectator] run function spleef:states/ingame_freeze/points_for_surviving
execute if score ?timer spleef.game >= time.ingame_freeze spleef.config if score ?round.number spleef.game matches ..12 run function spleef:states/ingame_spleef/start
execute if score ?timer spleef.game >= time.ingame_freeze spleef.config if score ?round.number spleef.game matches 13.. run function main:util/reset_gamerules
execute if score ?timer spleef.game >= time.ingame_freeze spleef.config if score ?round.number spleef.game matches 13.. run function main:api/end_game