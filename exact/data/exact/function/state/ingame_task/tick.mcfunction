# ============================================================
# exact:state/ingame_task/tick
# Called every tick during the task phase (20 seconds = 400 ticks)
#
# Holds the win checks for every task that has no vanilla
# advancement trigger to hang off. Those tasks use an
# "impossible" advancement that is granted from here instead.
# ============================================================

# Keep players fed, and shielded from each other's chaos. Task 7 is the
# one task where players are meant to hurt each other, so no resistance.
effect give @a[tag=!admin] saturation infinite 0 true
execute unless score ?task exact.state matches 7 run effect give @a[tag=!admin] resistance 1 4 true

# Task 2: keep the snow field topped up so nobody runs out of blocks to dig
execute if score ?task exact.state matches 2 run fill 50007 99 50007 49993 99 49993 snow_block

# Task 5: count sneaks, win at zero
execute if score ?task exact.state matches 5 as @a[tag=!exact.win] unless score @s exact.is_sneaking matches 1 if predicate exact:is_sneaking run scoreboard players remove @s exact.sneakcount 1
execute if score ?task exact.state matches 5 as @a[tag=!exact.win] unless score @s exact.is_sneaking matches 1 if predicate exact:is_sneaking run scoreboard players set @s exact.is_sneaking 1
execute if score ?task exact.state matches 5 as @a[tag=!exact.win] if score @s exact.is_sneaking matches 1 unless predicate exact:is_sneaking run scoreboard players set @s exact.is_sneaking 0
execute if score ?task exact.state matches 5 as @a[tag=!exact.win] if score @s exact.sneakcount matches 0 run advancement grant @s only exact:5

# Task 9: kill primed TNT before it can detonate, so a lit block simply
# vanishes and the arena is left standing
execute if score ?task exact.state matches 9 positioned 50000 100 50000 run kill @e[type=minecraft:tnt,distance=..100]

# Task 10: players knock the cube clean off the arena, so drop it back in
execute if score ?task exact.state matches 10 as @e[type=minecraft:sulfur_cube] at @s if predicate {type:"entity_properties",entity:"this",predicate:{"minecraft:location":{position:{y:{max:95}}}}} run tp @s 50000 115 50000

# Task 16: win once all four diamond pieces are actually worn
execute if score ?task exact.state matches 16 as @a[tag=!exact.win,tag=!admin] if items entity @s armor.head diamond_helmet if items entity @s armor.chest diamond_chestplate if items entity @s armor.legs diamond_leggings if items entity @s armor.feet diamond_boots run advancement grant @s only exact:16

# Task 17: cushions are entities, so sitting on one shows up as riding it.
# Held cushions get can_place_on so they can be placed in adventure mode.
execute if score ?task exact.state matches 17 as @a[tag=!admin] run item modify entity @s weapon.mainhand exact:can_place_anywhere
execute if score ?task exact.state matches 17 as @a[tag=!admin] run item modify entity @s weapon.offhand exact:can_place_anywhere
execute if score ?task exact.state matches 17 as @a[tag=!exact.win,tag=!admin] on vehicle if entity @s[type=minecraft:cushion] on passengers run advancement grant @s only exact:17

# Task 18: win on the way down, before the out-of-bounds catch at y-5
execute if score ?task exact.state matches 18 as @a[tag=!exact.win,tag=!admin] if predicate {type:"entity_properties",entity:"this",predicate:{"minecraft:location":{position:{y:{max:80}}}}} run advancement grant @s only exact:18

# Task 19: answered through a scoreboard trigger in the book
execute if score ?task exact.state matches 19 run scoreboard players enable @a exact.quickmath
execute if score ?task exact.state matches 19 as @a[tag=!exact.win] if score @s exact.quickmath matches 1 run advancement grant @s only exact:19
execute if score ?task exact.state matches 19 as @a if score @s exact.quickmath matches 1 run scoreboard players set @s exact.quickmath 0

# Task 20: win while sat on a pig (any pig -- saddles are the bottleneck)
execute if score ?task exact.state matches 20 as @a[tag=!exact.win,tag=!admin] on vehicle if entity @s[type=minecraft:pig] on passengers run advancement grant @s only exact:20

# Tasks 23-24: both grass courses are won by standing on a grass block
execute if score ?task exact.state matches 23 as @a[tag=!exact.win,tag=!admin] at @s if block ~ ~-1 ~ grass_block run advancement grant @s only exact:23
execute if score ?task exact.state matches 24 as @a[tag=!exact.win,tag=!admin] at @s if block ~ ~-1 ~ grass_block run advancement grant @s only exact:24

# Task 25: jumping on farmland tramples it back to dirt, which would eat the
# field over 20 seconds, so keep replacing it (the crop that was on top is
# still lost -- players have to replant that tile)
execute if score ?task exact.state matches 25 run fill 50007 99 50007 49993 99 49993 farmland[moisture=7] replace dirt

# Keep all players near the arena if they fall too low
execute as @a if predicate {type:"entity_properties",entity:"this",predicate:{"minecraft:location":{position:{y:{max:55}}}}} run tp @s @n[tag=exact.tp.arena]

# Persistent subtitle prompts and success title
title @a times 0 80 20
title @a[tag=!exact.win] title ""
execute if score ?task exact.state matches 5 as @a[tag=!exact.win] run title @s subtitle ["Sneak ",{"score":{"objective":"exact.sneakcount","name":"@s"}}," times!!"]
execute if score ?task exact.state matches 1 run title @a[tag=!exact.win] subtitle "Jump 9 blocks high!!"
execute if score ?task exact.state matches 2 run title @a[tag=!exact.win] subtitle "Break the shovel!!"
execute if score ?task exact.state matches 3 run title @a[tag=!exact.win] subtitle "Avenge Jack Black!!"
execute if score ?task exact.state matches 4 run title @a[tag=!exact.win] subtitle "Drink milk!!"
execute if score ?task exact.state matches 6 run title @a[tag=!exact.win] subtitle "Enchant pickaxe!!"
execute if score ?task exact.state matches 7 run title @a[tag=!exact.win] subtitle "Poke someone!!"
execute if score ?task exact.state matches 8 run title @a[tag=!exact.win] subtitle "Arson!!"
execute if score ?task exact.state matches 9 run title @a[tag=!exact.win] subtitle "Light a TNT block!!"
execute if score ?task exact.state matches 10 run title @a[tag=!exact.win] subtitle "Take damage!!"
execute if score ?task exact.state matches 11 run title @a[tag=!exact.win] subtitle "Blind yourself!!"
execute if score ?task exact.state matches 12 run title @a[tag=!exact.win] subtitle "Get hit by arrow!!"
execute if score ?task exact.state matches 13 run title @a[tag=!exact.win] subtitle "Get breeding!!"
execute if score ?task exact.state matches 14 run title @a[tag=!exact.win] subtitle "Fuck bees!!"
execute if score ?task exact.state matches 15 run title @a[tag=!exact.win] subtitle "Buy anything!!"
execute if score ?task exact.state matches 16 run title @a[tag=!exact.win] subtitle "Diamond armor, full set!!"
execute if score ?task exact.state matches 17 run title @a[tag=!exact.win] subtitle "Sit down!!"
execute if score ?task exact.state matches 18 run title @a[tag=!exact.win] subtitle "Jump into the void!!"
execute if score ?task exact.state matches 19 run title @a[tag=!exact.win] subtitle "Quick maths!!"
execute if score ?task exact.state matches 20 run title @a[tag=!exact.win] subtitle "Hog rider!!"
execute if score ?task exact.state matches 21 run title @a[tag=!exact.win] subtitle "Wololo!!"
execute if score ?task exact.state matches 22 run title @a[tag=!exact.win] subtitle "Drink water!!"
execute if score ?task exact.state matches 23 run title @a[tag=!exact.win] subtitle "Touch grass!!"
execute if score ?task exact.state matches 24 run title @a[tag=!exact.win] subtitle "Touch grass!!"
execute if score ?task exact.state matches 25 run title @a[tag=!exact.win] subtitle "Make bread!!"
execute if score ?task exact.state matches 26 run title @a[tag=!exact.win] subtitle "Craft blast furnace!!"
execute if score ?task exact.state matches 27 run title @a[tag=!exact.win] subtitle "Craft crossbow!!"
execute if score ?task exact.state matches 28 run title @a[tag=!exact.win] subtitle "Craft end crystal!!"
execute if score ?task exact.state matches 29 run title @a[tag=!exact.win] subtitle "Craft rabbit stew!!"
execute if score ?task exact.state matches 30 run title @a[tag=!exact.win] subtitle "Craft white harness!!"

title @a[tag=exact.win] title {"text":"SUCCESS","color":"green","bold":true}

# countdown
bossbar set exact:timer players @a
bossbar set exact:timer color blue
bossbar set exact:timer name "Following instructions..."
bossbar set exact:timer max 400
execute store result bossbar exact:timer value run scoreboard players get ?phase_timer exact.timer

# Check if task duration (400 ticks) has passed
execute if score ?phase_timer exact.timer matches 400.. run function exact:state/ingame_task/exit
