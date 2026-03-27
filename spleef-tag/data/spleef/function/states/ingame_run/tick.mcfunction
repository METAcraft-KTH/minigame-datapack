## INGAME PHASE: The game has begun, and people are playing

# increment timer
scoreboard players add ?timer spleef.game 1
# display round number
title @a[tag=!admin] actionbar ["FIND THE RIGHT BLOCK!! (",{"score": {"name": "?round.number","objective": "spleef.game"}},"/10)"]
scoreboard players operation #time spleef.game = time.ingame_run spleef.config
scoreboard players operation #time spleef.game -= ?timer spleef.game

# title
title @a times 0 10 0
title @a title ""
execute if score ?color.keep spleef.game matches 1 run title @a subtitle [{"text":"Stand on "},{"text":"red","color":"red"},"!!"]
execute if score ?color.keep spleef.game matches 2 run title @a subtitle [{"text":"Stand on "},{"text":"yellow","color":"yellow"},"!!"]
execute if score ?color.keep spleef.game matches 3 run title @a subtitle [{"text":"Stand on "},{"text":"orange","color":"gold"},"!!"]
execute if score ?color.keep spleef.game matches 4 run title @a subtitle [{"text":"Stand on "},{"text":"purple","color":"light_purple"},"!!"]
execute if score ?color.keep spleef.game matches 5 run title @a subtitle [{"text":"Stand on "},{"text":"green","color":"green"},"!!"]
execute if score ?color.keep spleef.game matches 6 run title @a subtitle [{"text":"Stand on "},{"text":"blue","color":"blue"},"!!"]

# kill players who fall off
execute at @n[type=marker,tag=spleef.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~
execute as @a[tag=!admin,scores={spleef.Y=..0}] run kill @s

# clear everyone's HUNGER!!
effect clear @a[tag=!admin] hunger
effect give @a[tag=!admin,gamemode=!spectator] speed 1 0 true

## end game
execute if score ?timer spleef.game >= time.ingame_run spleef.config run function spleef:states/ingame_freeze/start