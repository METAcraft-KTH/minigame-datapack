## INGAME PHASE: The game has begun, and people are playing

# increment timer
scoreboard players add ?timer spleef.game 1
execute store result bossbar spleef:timer value run scoreboard players get ?timer spleef.game
# display round number
title @a[tag=!admin] actionbar ["FIND THE RIGHT BLOCK!! (",{"score": {"name": "?round.number","objective": "spleef.game"}},"/13)"]
scoreboard players operation #time spleef.game = time.ingame_run spleef.config
scoreboard players operation #time spleef.game -= ?timer spleef.game

# title
title @a times 0 10 0
title @a title ""
execute if score ?color.keep spleef.game matches 1 run title @a subtitle [{"text":"Stand on "},{"text":"gold","color":"yellow"},"!!"]
execute if score ?color.keep spleef.game matches 2 run title @a subtitle [{"text":"Stand on "},{"text":"lapis","color":"blue"},"!!"]
execute if score ?color.keep spleef.game matches 3 run title @a subtitle [{"text":"Stand on "},{"text":"emerald","color":"green"},"!!"]
execute if score ?color.keep spleef.game matches 4 run title @a subtitle [{"text":"Stand on "},{"text":"quartz","color":"white"},"!!"]
execute if score ?color.keep spleef.game matches 5 run title @a subtitle [{"text":"Stand on "},{"text":"copper","color":"gold"},"!!"]
execute if score ?color.keep spleef.game matches 6 run title @a subtitle [{"text":"Stand on "},{"text":"redstone","color":"red"},"!!"]

# kill players who fall off
spawnpoint @a[tag=!admin] 30024 50 50024
execute as @a[tag=!admin,scores={spleef.Y=..0}] run kill @s

# clear everyone's HUNGER!!
effect clear @a[tag=!admin] hunger
effect give @a[tag=!admin,gamemode=!spectator] speed 1 0 true

## end game
execute if score ?timer spleef.game >= time.ingame_run spleef.config run function spleef:states/ingame_freeze/start