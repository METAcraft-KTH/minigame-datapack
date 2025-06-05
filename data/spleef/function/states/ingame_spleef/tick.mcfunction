## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function spleef:states/ingame_spleef/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function spleef:states/ingame_spleef/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function spleef:states/ingame_spleef/respawn

# increment timer
scoreboard players add ?timer spleef.game 1
# display round number
bossbar set spleef:timer name ["SPLEEEEF (",{"score": {"name": "?round.number","objective": "spleef.game"}},"/10)"]
execute store result bossbar spleef:timer value run scoreboard players get ?timer spleef.game

effect give @a[tag=!admin,gamemode=!spectator] speed 1 0 true

# mining gives saturation
execute as @a[scores={spleef.blockmined=3..}] run effect give @s saturation 1 0 true
execute as @a[scores={spleef.blockmined=3..}] run scoreboard players remove @s spleef.blockmined 3

# kill players who fall off
execute at @n[type=marker,tag=spleef.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~
execute as @a[tag=!admin,scores={spleef.Y=..0}] run kill @s

# if tnt run mode
execute positioned 50032 20 32 as @e[type=chicken,distance=..500] at @s run fill ~.5 ~-.1 ~.5 ~-.5 ~-.1 ~-.5 black_terracotta replace #terracotta
execute if score ?round.number spleef.game matches 7 as @a[tag=!admin,gamemode=adventure] at @s run fill ~.5 ~-.1 ~.5 ~-.5 ~-.1 ~-.5 black_terracotta replace #terracotta
execute if score ?round.number spleef.game matches 11 as @a[tag=!admin,gamemode=adventure] at @s run fill ~.5 ~-.1 ~.5 ~-.5 ~-.1 ~-.5 black_terracotta replace #terracotta

# darkness
execute if score ?round.number spleef.game matches 10 run effect give @a[tag=!admin,gamemode=adventure] darkness 2 0 true

## end game
execute if score ?timer spleef.game >= time.ingame_spleef spleef.config run function spleef:states/ingame_run/start