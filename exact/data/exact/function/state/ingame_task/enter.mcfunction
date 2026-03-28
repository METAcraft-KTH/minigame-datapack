# ============================================================
# exact:state/ingame_task/enter
# Called once when entering the task phase
# Set up the task for the current round (20 seconds = 400 ticks)
# Display task instructions in subtitle
# ============================================================

# Clear titles
title @a clear

# Reset players for the new round
effect clear @a[tag=!admin]
clear @a[tag=!admin]
tag @a remove exact.win

# Round banner
tellraw @a [{"text":"ROUND ","color":"gold","bold":true},{"score":{"name":"?round","objective":"exact.state"}}]

# Reset spawn point to arena marker when available
execute at @n[type=marker,tag=exact.tp.arena] run spawnpoint @a[tag=!admin] ~ ~ ~ ~ ~

# Round 1: Enchant diamond pickaxe!!
execute if score ?round exact.state matches 1 run give @a[tag=!admin] diamond_pickaxe
execute if score ?round exact.state matches 1 run give @a[tag=!admin] lapis_lazuli 32
execute if score ?round exact.state matches 1 run give @a[tag=!admin] experience_bottle 32
execute if score ?round exact.state matches 1 run fill 50007 99 50007 49993 99 49993 enchanting_table

# Round 2: Heal to full health!!
execute if score ?round exact.state matches 2 as @a[tag=!admin] run damage @s 19 minecraft:generic
execute if score ?round exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:healing"}] 1
execute if score ?round exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:regeneration"}] 1
execute if score ?round exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:strong_healing"}] 1
execute if score ?round exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:healing"}] 1
execute if score ?round exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:long_regeneration"}] 1
execute if score ?round exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:healing"}] 1

# Round 3: Wololo!!
execute if score ?round exact.state matches 3 at @a[tag=!admin] run summon sheep ~ ~ ~ {Color:11b}
execute if score ?round exact.state matches 3 run give @a[tag=!admin] poppy 1

# Round 4: Make 10 emeralds!!
execute if score ?round exact.state matches 4 at @n[type=marker,tag=exact.tp.arena] run summon villager ~ ~ ~ {VillagerData:{profession:"minecraft:fletcher",level:5,type:"minecraft:plains"},Invulnerable:1b}
execute if score ?round exact.state matches 4 run give @a[tag=!admin] oak_log 16
execute if score ?round exact.state matches 4 run give @a[tag=!admin] birch_log 16
execute if score ?round exact.state matches 4 run give @a[tag=!admin] spruce_log 16
execute if score ?round exact.state matches 4 run give @a[tag=!admin] jungle_log 16
execute if score ?round exact.state matches 4 run give @a[tag=!admin] acacia_log 16

# Round 5: Sneak 50 times!!
execute if score ?round exact.state matches 5 run scoreboard players set @a exact.sneakcount 50
execute if score ?round exact.state matches 5 run scoreboard players set @a exact.is_sneaking 0

# Round 6: Defeat chicken jockey!!
execute if score ?round exact.state matches 6 run difficulty hard
execute if score ?round exact.state matches 6 run spawnpoint @a 50000 100 50000
execute if score ?round exact.state matches 6 at @a[tag=!admin] run summon chicken ~ ~ ~ {IsChickenJockey:1b,Passengers:[{id:"minecraft:zombie",IsBaby:1b}]}
execute if score ?round exact.state matches 6 run give @a[tag=!admin] iron_sword

# Round 7: Tower up!!
execute if score ?round exact.state matches 6 run difficulty peaceful
execute if score ?round exact.state matches 7 run give @a[tag=!admin] stone_bricks 64

# Round 8: Quick maths!!
execute if score ?round exact.state matches 8 as @a[tag=!admin] run function exact:state/ingame_task/task_8_book
execute if score ?round exact.state matches 8 run scoreboard players enable @a exact.quickmath
execute if score ?round exact.state matches 8 run scoreboard players set @a exact.quickmath 0

# Round 9: Give away diamond!!
execute if score ?round exact.state matches 9 run give @a[tag=!admin] diamond 1

# Round 10: Kill someone!!
execute if score ?round exact.state matches 10 run give @a[tag=!admin] iron_sword

# Round 11: Touch grass!!
execute if score ?round exact.state matches 11 run tp @a[tag=!admin] @n[type=marker,tag=exact.tp.parkour]
execute if score ?round exact.state matches 11 at @n[type=marker,tag=exact.tp.parkour] run spawnpoint @a[tag=!admin]

# Round 12: Break the shovel!!
execute if score ?round exact.state matches 12 run fill 50007 99 50007 49993 99 49993 snow_block
execute if score ?round exact.state matches 12 run give @a[tag=!admin] golden_shovel[can_break={blocks:"snow_block"}]

# Round 13: Make rabbit stew!!
execute if score ?round exact.state matches 13 run fill 50007 99 50007 49993 99 49993 crafting_table
execute if score ?round exact.state matches 13 run give @a[tag=!admin] cooked_rabbit
execute if score ?round exact.state matches 13 run give @a[tag=!admin] beetroot
execute if score ?round exact.state matches 13 run give @a[tag=!admin] carrot
execute if score ?round exact.state matches 13 run give @a[tag=!admin] potato
execute if score ?round exact.state matches 13 run give @a[tag=!admin] baked_potato
execute if score ?round exact.state matches 13 run give @a[tag=!admin] brown_mushroom
execute if score ?round exact.state matches 13 run give @a[tag=!admin] poisonous_potato
execute if score ?round exact.state matches 13 run give @a[tag=!admin] bowl
execute if score ?round exact.state matches 13 run give @a[tag=!admin] red_mushroom

# Round 14: Take damage!!
execute if score ?round exact.state matches 14 run give @a[tag=!admin] splash_potion[potion_contents={potion:"minecraft:strong_harming"}] 1

# Round 15: Launch 11 blocks up!!
execute if score ?round exact.state matches 15 run give @a[tag=!admin] wind_charge 64
execute if score ?round exact.state matches 15 as @a[tag=!admin] store result score @s exact.y_start run data get entity @s Pos[1] 1

# Round 16: BOSS GAME: Pig racing!!
execute if score ?round exact.state matches 16 run tp @a[tag=!admin] @n[type=marker,tag=exact.tp.pig_race]
execute if score ?round exact.state matches 16 at @a[tag=!admin] run summon pig ~ ~ ~ {Saddle:1b}
execute if score ?round exact.state matches 16 run give @a[tag=!admin] carrot_on_a_stick

# Reset phase timer unless round 13 already extended the timer
scoreboard players set ?phase_timer exact.timer 0
