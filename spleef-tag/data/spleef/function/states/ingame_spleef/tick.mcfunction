## INGAME PHASE: The game has begun, and people are playing

# increment timer
scoreboard players add ?timer spleef.game 1
title @a[tag=!admin] actionbar ["SPLEEEEF (",{"score": {"name": "?round.number","objective": "spleef.game"}},"/10)"]

effect give @a[tag=!admin,gamemode=!spectator] speed 1 0 true

# mining gives saturation
execute as @a[scores={spleef.blockmined=3..}] run effect give @s saturation 1 0 true
execute as @a[scores={spleef.blockmined=3..}] run scoreboard players remove @s spleef.blockmined 3

# kill players who fall off
execute at @n[type=marker,tag=spleef.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~
execute as @a[tag=!admin,scores={spleef.Y=..0}] run kill @s

# tnt tag
execute as @a[tag=!admin] store result score @s spleef.hastnt run clear @s tnt 0
title @a[scores={spleef.hastnt=1..}] actionbar {"text":"You are holding TNT! Punch someone to give it away!","color":"red"}
title @a[scores={spleef.hastnt=0}] actionbar {"text":"Mine blocks to regain hunger!","color":"white"}

# if tnt run mode
execute positioned 50032 20 32 as @e[type=chicken,distance=..500] at @s run fill ~.5 ~-.1 ~.5 ~-.5 ~-.1 ~-.5 black_terracotta replace #terracotta
execute if score ?round.number spleef.game matches 7 as @a[tag=!admin,gamemode=adventure] at @s run fill ~.5 ~-.1 ~.5 ~-.5 ~-.1 ~-.5 black_terracotta replace #terracotta
execute if score ?round.number spleef.game matches 11 as @a[tag=!admin,gamemode=adventure] at @s run fill ~.5 ~-.1 ~.5 ~-.5 ~-.1 ~-.5 black_terracotta replace #terracotta

# darkness
execute if score ?round.number spleef.game matches 10 run effect give @a[tag=!admin,gamemode=adventure] darkness 2 0 true

# break floors
execute if score ?round.number spleef.game matches 12 if score ?timer spleef.game matches 100.. positioned 50032 10 32 as @e[tag=spleef.floor,distance=..100,type=marker,sort=random,limit=3] at @s run setblock ~ ~ ~ air destroy

## end game
execute if score ?timer spleef.game >= time.ingame_spleef spleef.config run function spleef:states/ingame_run/start