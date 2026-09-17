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

# Pick this round's task (random, never repeats within a game)
function exact:util/draw_task

# Round banner
tellraw @a [{"text":"ROUND ","color":"gold","bold":true},{"score":{"name":"?round","objective":"exact.state"}}]

# Reset spawn point to arena marker when available
spawnpoint @a[tag=!admin] 50000 100 50000 ~ ~

# Task 1: Enchant diamond pickaxe!!
execute if score ?task exact.state matches 1 run give @a[tag=!admin] diamond_pickaxe
execute if score ?task exact.state matches 1 run give @a[tag=!admin] lapis_lazuli 32
execute if score ?task exact.state matches 1 run give @a[tag=!admin] experience_bottle 32
execute if score ?task exact.state matches 1 run fill 50007 99 50007 49993 99 49993 enchanting_table

# Task 2: Heal to full health!!
execute if score ?task exact.state matches 2 run gamerule natural_health_regeneration false
execute if score ?task exact.state matches 2 as @a[tag=!admin] run damage @s 19 minecraft:starve
execute if score ?task exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:healing"}] 1
execute if score ?task exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:regeneration"}] 1
execute if score ?task exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:strong_healing"}] 1
execute if score ?task exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:healing"}] 1
execute if score ?task exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:long_regeneration"}] 1
execute if score ?task exact.state matches 2 run give @a[tag=!admin] potion[potion_contents={potion:"minecraft:healing"}] 1

# Task 3: Wololo!!
execute if score ?task exact.state matches 3 at @a[tag=!admin] run summon sheep ~ ~ ~ {Color:11b}
execute if score ?task exact.state matches 3 run give @a[tag=!admin] poppy 1

# Task 4: Make 10 emeralds!!
execute if score ?task exact.state matches 4 at @a[tag=!admin] run summon villager ~ ~ ~
execute if score ?task exact.state matches 4 run fill 50007 99 50007 49993 99 49993 fletching_table
execute if score ?task exact.state matches 4 run give @a[tag=!admin] oak_log 16
execute if score ?task exact.state matches 4 run give @a[tag=!admin] birch_log 16
execute if score ?task exact.state matches 4 run give @a[tag=!admin] spruce_log 16
execute if score ?task exact.state matches 4 run give @a[tag=!admin] jungle_log 16
execute if score ?task exact.state matches 4 run give @a[tag=!admin] acacia_log 16

# Task 5: Sneak 50 times!!
execute if score ?task exact.state matches 5 run scoreboard players set @a exact.sneakcount 67
execute if score ?task exact.state matches 5 run scoreboard players set @a exact.is_sneaking 0

# Task 6: Defeat chicken jockey!!
execute if score ?task exact.state matches 6 run difficulty hard
execute if score ?task exact.state matches 6 run spawnpoint @a 50000 100 50000
execute if score ?task exact.state matches 6 at @a[tag=!admin] run summon chicken ~ ~ ~ {IsChickenJockey:1b,Passengers:[{id:"minecraft:zombie",IsBaby:1b,equipment:{head:{id:"oak_button"}}}]}
execute if score ?task exact.state matches 6 run give @a[tag=!admin] wooden_sword

# Task 7: Tower up!!
execute if score ?task exact.state matches 7 run difficulty peaceful
execute if score ?task exact.state matches 7 run give @a[tag=!admin] stone_bricks[can_place_on={}] 64

# Task 8: Quick maths!!
execute if score ?task exact.state matches 8 as @a[tag=!admin] run function exact:state/ingame_task/task_8_book
execute if score ?task exact.state matches 8 run scoreboard players enable @a exact.quickmath
execute if score ?task exact.state matches 8 run scoreboard players set @a exact.quickmath 0

# Task 9: Give away diamond!!
execute if score ?task exact.state matches 9 run give @a[tag=!admin] diamond 1

# Task 10: Kill someone!!
execute if score ?task exact.state matches 10 run give @a[tag=!admin] iron_sword

# Task 11: Touch grass!!
execute if score ?task exact.state matches 11 run fill 50007 99 50007 49993 99 49993 water
execute if score ?task exact.state matches 11 run fill 49998 115 49998 50002 115 50002 minecraft:grass_block
execute if score ?task exact.state matches 11 run give @a[tag=!admin] trident[enchantments={riptide:3}]

# Task 12: Break the shovel!!
execute if score ?task exact.state matches 12 run fill 50007 99 50007 49993 99 49993 snow_block
execute if score ?task exact.state matches 12 run give @a[tag=!admin] golden_shovel[can_break={blocks:"snow_block"}]

# Task 13: Make rabbit stew!!
execute if score ?task exact.state matches 13 run fill 50007 99 50007 49993 99 49993 crafting_table
execute if score ?task exact.state matches 13 run give @a[tag=!admin] cooked_rabbit
execute if score ?task exact.state matches 13 run give @a[tag=!admin] beetroot
execute if score ?task exact.state matches 13 run give @a[tag=!admin] carrot
execute if score ?task exact.state matches 13 run give @a[tag=!admin] potato
execute if score ?task exact.state matches 13 run give @a[tag=!admin] baked_potato
execute if score ?task exact.state matches 13 run give @a[tag=!admin] brown_mushroom
execute if score ?task exact.state matches 13 run give @a[tag=!admin] poisonous_potato
execute if score ?task exact.state matches 13 run give @a[tag=!admin] bowl
execute if score ?task exact.state matches 13 run give @a[tag=!admin] red_mushroom

# Task 14: Take damage!!
execute if score ?task exact.state matches 14 run give @a[tag=!admin] splash_potion[potion_contents={potion:"minecraft:strong_turtle_master"}] 1
execute if score ?task exact.state matches 14 run give @a[tag=!admin] splash_potion[potion_contents={potion:"minecraft:leaping"}] 1
execute if score ?task exact.state matches 14 run give @a[tag=!admin] splash_potion[potion_contents={potion:"minecraft:strong_harming"}] 1
execute if score ?task exact.state matches 14 run give @a[tag=!admin] splash_potion[potion_contents={potion:"minecraft:swiftness"}] 1
execute if score ?task exact.state matches 14 run give @a[tag=!admin] splash_potion[potion_contents={potion:"minecraft:healing"}] 1
execute if score ?task exact.state matches 14 run give @a[tag=!admin] pufferfish
execute if score ?task exact.state matches 14 run give @a[tag=!admin] splash_potion[potion_contents={potion:"minecraft:poison"}] 1

# Task 15: Launch 11 blocks up!!
execute if score ?task exact.state matches 15 run give @a[tag=!admin] wind_charge 64


# Reset phase timer unless round 13 already extended the timer
scoreboard players set ?phase_timer exact.timer 0
