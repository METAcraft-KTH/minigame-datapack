## INGAME PHASE: The game has begun, and people are playing

# increment timer
scoreboard players add ?timer spleef.game 1
title @a[tag=!admin] actionbar ["SPLEEEEF (",{"score": {"name": "?round.number","objective": "spleef.game"}},"/13)"]

effect give @a[tag=!admin,gamemode=!spectator] speed 1 0 true

# mining gives saturation
execute as @a[scores={spleef.blockmined=3..}] run effect give @s saturation 1 0 true
execute as @a[scores={spleef.blockmined=3..}] run scoreboard players remove @s spleef.blockmined 3

# kill players who fall off
spawnpoint @a[tag=!admin] 30024 50 50024
execute as @a[tag=!admin,scores={spleef.Y=..0}] run kill @s

## end game
execute if score ?timer spleef.game >= time.ingame_spleef spleef.config run function spleef:states/ingame_run/start