## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function qq:states/ingame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function qq:states/ingame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function qq:states/ingame/respawn

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
# One in the Quiver
execute if score mode qq.config matches 0 if score #displayseconds qq.game matches ..9 run bossbar set qq:timer name ["One in the Quiver ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":0",{"score": {"name": "#displayseconds","objective": "qq.game"}}]
execute if score mode qq.config matches 0 if score #displayseconds qq.game matches 10.. run bossbar set qq:timer name ["One in the Quiver ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":",{"score": {"name": "#displayseconds","objective": "qq.game"}}]

# Ray Tag
execute if score mode qq.config matches 1 if score #displayseconds qq.game matches ..9 run bossbar set qq:timer name ["Ray Tag ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":0",{"score": {"name": "#displayseconds","objective": "qq.game"}}]
execute if score mode qq.config matches 1 if score #displayseconds qq.game matches 10.. run bossbar set qq:timer name ["Ray Tag ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":",{"score": {"name": "#displayseconds","objective": "qq.game"}}]

# Quake Mode
execute if score mode qq.config matches 2 if score #displayseconds qq.game matches ..9 run bossbar set qq:timer name ["Quake Mode ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":0",{"score": {"name": "#displayseconds","objective": "qq.game"}}]
execute if score mode qq.config matches 2 if score #displayseconds qq.game matches 10.. run bossbar set qq:timer name ["Quake Mode ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":",{"score": {"name": "#displayseconds","objective": "qq.game"}}]

# Ghost Trick
execute if score mode qq.config matches 3 if score #displayseconds qq.game matches ..9 run bossbar set qq:timer name ["Trident Trick ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":0",{"score": {"name": "#displayseconds","objective": "qq.game"}}]
execute if score mode qq.config matches 3 if score #displayseconds qq.game matches 10.. run bossbar set qq:timer name ["Trident Trick ends in ",{"score": {"name": "#displayminutes","objective": "qq.game"}},":",{"score": {"name": "#displayseconds","objective": "qq.game"}}]


execute store result bossbar qq:timer value run scoreboard players get ?timer qq.game

## end game
execute if score ?timer qq.game >= time.ingame qq.config run function qq:states/postgame/start

# spawn timer
execute as @a[tag=!admin] if score @s GLOBAL.time_alive matches ..60 at @s run function qq:states/ingame/spawn_timer

# disallow offhand
execute as @a[tag=!admin] if items entity @s weapon.offhand * at @s run function qq:states/ingame/no_offhand

# Disallow dropping items
execute as @e[type=item] at @s on origin if entity @s[tag=!admin] run tag @n[type=item] add qq.pickup
execute as @e[type=item,tag=qq.pickup] at @s on origin run data modify entity @n[type=item] Owner set from entity @s UUID
execute as @e[type=item,tag=qq.pickup] run data modify entity @s PickupDelay set value 0s
execute as @e[type=item,tag=qq.pickup] at @s on origin run tp @n[type=item] @s


# ghost trick tick
execute if score mode qq.config matches 3 run function qq:states/ingame/ghost_trick_tick