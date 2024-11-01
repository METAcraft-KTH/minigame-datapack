## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..}] run function qq:states/ingame/join
execute as @a[scores={GLOBAL.time_alive=0}] run function qq:states/ingame/while_dead
execute as @a[scores={GLOBAL.time_alive=1}] run function qq:states/ingame/respawn

# increment timer
scoreboard players add ?timer qq.game 1
# calculate remaining time
scoreboard players operation #remainingseconds qq.game = time.ingame qq.config
scoreboard players operation #remainingseconds qq.game -= ?timer qq.game
scoreboard players operation #remainingseconds qq.game /= 20 GLOBAL
scoreboard players operation #displayminutes qq.game = #remainingseconds qq.game
scoreboard players operation #displayminutes qq.game /= 60 GLOBAL
scoreboard players operation #displayseconds qq.game = #remainingseconds qq.game
scoreboard players operation #displayseconds qq.game %= 60 GLOBAL
# display remaining time
execute if score #displayseconds qq.game matches ..9 run bossbar set qq:timer name ["One in the Quiver ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":0",{"score": {"name": "#displayseconds","objective": "qq.game"}}]
execute if score #displayseconds qq.game matches 10.. run bossbar set qq:timer name ["One in the Quiver ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":",{"score": {"name": "#displayseconds","objective": "qq.game"}}]
execute store result bossbar qq:timer value run scoreboard players get ?timer qq.game

## end game
execute if score ?timer qq.game >= time.ingame qq.config run function qq:states/postgame/start

# spawn timer
execute as @a if score @s GLOBAL.time_alive matches ..60 at @s run function qq:states/ingame/spawn_timer

# disallow offhand
execute as @a if items entity @s weapon.offhand * at @s run function qq:states/ingame/no_offhand

# Disallow dropping items
execute as @e[type=item] at @s on origin run data modify entity @n[type=item] Owner set from entity @s UUID
execute as @e[type=item] run data modify entity @s PickupDelay set value 0s
execute as @e[type=item] at @s on origin run tp @n[type=item] @s