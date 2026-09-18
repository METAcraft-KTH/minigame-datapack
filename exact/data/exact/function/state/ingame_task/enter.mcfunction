# ============================================================
# exact:state/ingame_task/enter
# Called once when entering the task phase (20 seconds = 400 ticks)
#
# Draws the round's task, builds the arena for it and hands out
# the items it needs. Everything here is keyed on ?task, NOT
# ?round -- the task order is shuffled.
#
# Arena reference:
#   platform  = fill 50007 99 50007 49993 99 49993 (15x15, top at y99)
#   players   = stand at y100, arena centre is 50000 100 50000
#   the platform is restored to iron_block in ingame_wait/enter
# ============================================================

# Clear titles
title @a clear

# Reset players for the new round
effect clear @a[tag=!admin]
clear @a[tag=!admin]
tag @a remove exact.win

# Pick this round's task (random, never repeats within a game)
function exact:util/draw_task

# How many players may finish before the round is cut short
function exact:util/set_cutoff

# Round banner
tellraw @a [{"text":"ROUND ","color":"gold","bold":true},{"score":{"name":"?round","objective":"exact.state"}}]

# Reset spawn point to arena marker when available
spawnpoint @a[tag=!admin] 50000 100 50000 ~ ~

# Task 1: Jump 9 blocks high!!
execute if score ?task exact.state matches 1 run give @a[tag=!admin] wind_charge 64

# Task 2: Break the shovel!!
execute if score ?task exact.state matches 2 run fill 50007 99 50007 49993 99 49993 snow_block
execute if score ?task exact.state matches 2 run give @a[tag=!admin] golden_shovel[can_break={blocks:"snow_block"}]

# Task 3: Avenge Jack Black!! (kill the chicken jockey)
execute if score ?task exact.state matches 3 run difficulty hard
execute if score ?task exact.state matches 3 at @a[tag=!admin] run summon chicken ~ ~ ~ {IsChickenJockey:1b,Passengers:[{id:"minecraft:zombie",IsBaby:1b,equipment:{head:{id:"oak_button"}}}]}
execute if score ?task exact.state matches 3 run give @a[tag=!admin] wooden_sword

# Task 4: Drink milk!!
execute if score ?task exact.state matches 4 run summon cow 50000 100 50000
execute if score ?task exact.state matches 4 run give @a[tag=!admin] bucket

# Task 5: Sneak 67 times!!
execute if score ?task exact.state matches 5 run scoreboard players set @a exact.sneakcount 67
execute if score ?task exact.state matches 5 run scoreboard players set @a exact.is_sneaking 0

# Task 6: Enchant pickaxe!!
execute if score ?task exact.state matches 6 run fill 50007 99 50007 49993 99 49993 enchanting_table
execute if score ?task exact.state matches 6 run give @a[tag=!admin] diamond_pickaxe
execute if score ?task exact.state matches 6 run give @a[tag=!admin] lapis_lazuli 32
execute if score ?task exact.state matches 6 run give @a[tag=!admin] experience_bottle 32

# Task 7: Poke someone!! (the only task where players may hurt each other,
# so ingame_task/tick withholds resistance for this one)
execute if score ?task exact.state matches 7 run give @a[tag=!admin] diamond_spear

# Task 8: Arson!! (3x3x3 hay cube floating 2 blocks above head height)
# doFireTick is off so the cube does not burn away before everyone has lit it
execute if score ?task exact.state matches 8 run gamerule fire_spread_radius_around_player 0
execute if score ?task exact.state matches 8 run fill 50001 102 50001 49999 104 49999 hay_block
execute if score ?task exact.state matches 8 run give @a[tag=!admin] flint_and_steel[can_place_on={blocks:"hay_block"}]

# Task 9: Light a TNT block!! Swaps the light gray concrete powder floor at
# y98 for TNT instead of touching the platform. MAIN's reset_gamerules already
# leaves tnt_explodes true, but set it explicitly so the task cannot silently
# break if something else turned it off.
execute if score ?task exact.state matches 9 run gamerule tnt_explodes true
execute if score ?task exact.state matches 9 run fill 49981 98 49981 50019 98 50019 tnt replace light_gray_concrete_powder
execute if score ?task exact.state matches 9 run give @a[tag=!admin] flint_and_steel

# Task 10: Take damage!! No items -- a sulfur cube holding a magma block is
# "hot", so touching it burns. The absorbed block lives in equipment.body, and
# holding one immobilises the cube but makes it take knockback instead of
# damage, so players punch it around the arena. Fall damage is on for this
# task only, so dropping off the edge counts as well.
execute if score ?task exact.state matches 10 run gamerule fall_damage true
execute if score ?task exact.state matches 10 run summon sulfur_cube 50000 115 50000 {equipment:{body:{id:"minecraft:magma_block"}},Glowing:1b}

# Task 11: Blind yourself!! (suspicious stew with an azure bluet)
execute if score ?task exact.state matches 11 run fill 50007 99 50007 49993 99 49993 crafting_table
execute if score ?task exact.state matches 11 run give @a[tag=!admin] bowl 10
execute if score ?task exact.state matches 11 run give @a[tag=!admin] red_mushroom 10
execute if score ?task exact.state matches 11 run give @a[tag=!admin] brown_mushroom 10
execute if score ?task exact.state matches 11 run give @a[tag=!admin] allium 2
execute if score ?task exact.state matches 11 run give @a[tag=!admin] azure_bluet 2
execute if score ?task exact.state matches 11 run give @a[tag=!admin] lily_of_the_valley 2
execute if score ?task exact.state matches 11 run give @a[tag=!admin] red_tulip 2
execute if score ?task exact.state matches 11 run give @a[tag=!admin] wither_rose 2

# Task 12: Get hit by arrow!! Fire straight up and stand still. Fall damage is
# forced off here so that, unlike task 10, nobody can cop out by stepping into
# the void -- the arrow is the only damage on offer.
execute if score ?task exact.state matches 12 run gamerule fall_damage false
execute if score ?task exact.state matches 12 run give @a[tag=!admin] bow
execute if score ?task exact.state matches 12 run give @a[tag=!admin] arrow 10

# Task 13: Get breeding!! (2 wheat feeds 2 animals -- players have to share
# the herd, since one cow and one sheep spawn per player)
execute if score ?task exact.state matches 13 at @a[tag=!admin] run summon cow ~ ~ ~
execute if score ?task exact.state matches 13 at @a[tag=!admin] run summon sheep ~ ~ ~
execute if score ?task exact.state matches 13 run give @a[tag=!admin] wheat 2

# Task 14: Fuck bees!! (nests fill the layer players stand in, so they get
# pushed up on top of the field and break a nest from above)
execute if score ?task exact.state matches 14 run fill 50007 100 50007 49993 100 49993 bee_nest[honey_level=5]
execute if score ?task exact.state matches 14 run give @a[tag=!admin] golden_axe[can_break={blocks:"bee_nest"}]

# Task 15: Buy anything!! (mine emeralds, then trade them)
execute if score ?task exact.state matches 15 run fill 50007 99 50007 49993 99 49993 emerald_ore
execute if score ?task exact.state matches 15 run give @a[tag=!admin] iron_pickaxe[can_break={blocks:"emerald_ore"}]
execute if score ?task exact.state matches 15 at @a[tag=!admin] run summon wandering_trader ~ ~ ~

# Task 16: Diamond armor, full set!!
execute if score ?task exact.state matches 16 at @a[tag=!admin] run summon armor_stand ~ ~ ~ {equipment:{head:{id:"minecraft:diamond_helmet"},chest:{id:"minecraft:diamond_chestplate"},legs:{id:"minecraft:diamond_leggings"},feet:{id:"minecraft:diamond_boots"}}}

# Task 17: Sit down!! (64 string -> wool -> wool slabs -> cushion)
execute if score ?task exact.state matches 17 run fill 50007 99 50007 49993 99 49993 crafting_table
execute if score ?task exact.state matches 17 run give @a[tag=!admin] string 64

# Task 18: Jump into the void!! (nothing to set up -- walk off the platform)

# Task 19: Quick maths!!
execute if score ?task exact.state matches 19 as @a[tag=!admin] run function exact:state/ingame_task/task_19_book
execute if score ?task exact.state matches 19 run scoreboard players enable @a exact.quickmath
execute if score ?task exact.state matches 19 run scoreboard players set @a exact.quickmath 0

# Task 20: Hog rider!! (craft a saddle, then mount a pig)
execute if score ?task exact.state matches 20 run fill 50007 99 50007 49993 99 49993 crafting_table
execute if score ?task exact.state matches 20 as @a[tag=!admin] run summon pig 50000 100 50000
execute if score ?task exact.state matches 20 run give @a[tag=!admin] leather 3
execute if score ?task exact.state matches 20 run give @a[tag=!admin] iron_nugget 9

# Task 21: Wololo!! (poppy -> red dye in the 2x2 grid, then dye the sheep)
execute if score ?task exact.state matches 21 at @a[tag=!admin] run summon sheep ~ ~ ~ {Color:11b}
execute if score ?task exact.state matches 21 run give @a[tag=!admin] poppy 1

# Task 22: Drink water!!
execute if score ?task exact.state matches 22 run fill 50007 99 50007 49993 99 49993 water_cauldron[level=1]
execute if score ?task exact.state matches 22 run give @a[tag=!admin] glass_bottle

# Task 23: Touch grass!! (riptide) -- the platform becomes water so the
# trident works, and a small grass island sits overhead to aim for.
execute if score ?task exact.state matches 23 run fill 50007 99 50007 49993 99 49993 water
execute if score ?task exact.state matches 23 run fill 49998 115 49998 50002 115 50002 grass_block
execute if score ?task exact.state matches 23 run give @a[tag=!admin] trident[enchantments={riptide:3}]

# Task 24: Touch grass!! (speed II)
# COORDINATES ARE PLACEHOLDERS -- replace 0 0 0 with the real course spawn.
execute if score ?task exact.state matches 24 run tp @a[tag=!admin] 0 0 0
execute if score ?task exact.state matches 24 run effect give @a[tag=!admin] speed infinite 1 true

# Task 25: Make bread!! The platform becomes wet farmland to plant on, and the
# y98 floor ring becomes crafting tables (bread is a 3-wide recipe). Farmland
# keeps its moisture because MAIN's reset_gamerules leaves random_tick_speed 0.
execute if score ?task exact.state matches 25 run fill 50007 99 50007 49993 99 49993 farmland[moisture=7]
execute if score ?task exact.state matches 25 run fill 49981 98 49981 50019 98 50019 crafting_table replace light_gray_concrete_powder
execute if score ?task exact.state matches 25 run give @a[tag=!admin] diamond_hoe[can_break={blocks:"wheat"}]
execute if score ?task exact.state matches 25 run give @a[tag=!admin] wheat_seeds[can_place_on={blocks:"farmland"}] 64
execute if score ?task exact.state matches 25 run give @a[tag=!admin] bone_meal[can_place_on={blocks:"wheat"}] 64

# Tasks 26-30: crafting tasks. Same crafting-table platform and the same
# 64-of-everything kit, dealt into the backpack so the hotbar stays clear.
execute if score ?task exact.state matches 26..30 run fill 50007 99 50007 49993 99 49993 crafting_table
execute if score ?task exact.state matches 26..30 as @a[tag=!admin] run function exact:state/ingame_task/craft_kit

# Reset phase timer
scoreboard players set ?phase_timer exact.timer 0
