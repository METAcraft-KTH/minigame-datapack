# ============================================================
# exact:state/ingame_task/tick
# Called every tick during task phase
# Check for winners and advance timer
# (20 seconds = 400 ticks)
# ============================================================

# Keep players alive and apply task-side mechanics
effect give @a[tag=!admin] saturation infinite 0 true
execute unless score ?round exact.state matches 2 run effect give @a[tag=!admin] resistance 1 4 true
execute if score ?round exact.state matches 2 run effect clear @a[tag=!admin] resistance

# Round 5: count sneaks and complete via impossible advancement
execute if score ?round exact.state matches 5 as @a[tag=!exact.win] unless score @s exact.is_sneaking matches 1 if predicate exact:is_sneaking run scoreboard players remove @s exact.sneakcount 1
execute if score ?round exact.state matches 5 as @a[tag=!exact.win] unless score @s exact.is_sneaking matches 1 if predicate exact:is_sneaking run scoreboard players set @s exact.is_sneaking 1
execute if score ?round exact.state matches 5 as @a[tag=!exact.win] if score @s exact.is_sneaking matches 1 unless predicate exact:is_sneaking run scoreboard players set @s exact.is_sneaking 0
execute if score ?round exact.state matches 5 as @a[tag=!exact.win] if score @s exact.sneakcount matches 0 run advancement grant @s only exact:5

# Round 2: complete when player reaches full health again
execute if score ?round exact.state matches 2 as @a[tag=!exact.win,tag=!admin,nbt={Health:20.0f}] run advancement grant @s only exact:2

# Round 7: win when player reaches Y > 122
execute if score ?round exact.state matches 7 as @a[tag=!exact.win,tag=!admin] if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{min:123}}}}} run advancement grant @s only exact:7

# Round 8: scoreboard trigger based completion
execute if score ?round exact.state matches 8 run scoreboard players enable @a exact.quickmath
execute if score ?round exact.state matches 8 as @a[tag=!exact.win] if score @s exact.quickmath matches 1.. run advancement grant @s only exact:8
execute if score ?round exact.state matches 8 as @a if score @s exact.quickmath matches 1.. run scoreboard players set @s exact.quickmath 0

# Round 11: win when touching grass block
execute if score ?round exact.state matches 11 as @a[tag=!exact.win,tag=!admin] at @s if block ~ ~-1 ~ grass_block run advancement grant @s only exact:11

# Keep all players near the arena if they fall too low
execute as @a if predicate {condition:"entity_properties",entity:"this",predicate:{location:{position:{y:{max:-5}}}}} run tp @s @n[tag=exact.tp.arena]

# Persistent subtitle prompts and success title
title @a times 0 80 20
title @a[tag=!exact.win] title ""
execute if score ?round exact.state matches 1 run title @a[tag=!exact.win] subtitle "Enchant diamond pickaxe!!"
execute if score ?round exact.state matches 2 run title @a[tag=!exact.win] subtitle "Heal to full health!!"
execute if score ?round exact.state matches 3 run title @a[tag=!exact.win] subtitle "Wololo!!"
execute if score ?round exact.state matches 4 run title @a[tag=!exact.win] subtitle "Make 10 emeralds!!"
execute if score ?round exact.state matches 5 as @a[tag=!exact.win] run title @s subtitle ["Sneak ",{"score":{"objective":"exact.sneakcount","name":"@s"}}," times!!"]
execute if score ?round exact.state matches 6 run title @a[tag=!exact.win] subtitle "Defeat chicken jockey!!"
execute if score ?round exact.state matches 7 run title @a[tag=!exact.win] subtitle "Tower up!!"
execute if score ?round exact.state matches 8 run title @a[tag=!exact.win] subtitle "Quick maths!!"
execute if score ?round exact.state matches 9 run title @a[tag=!exact.win] subtitle "Give away diamond!!"
execute if score ?round exact.state matches 10 run title @a[tag=!exact.win] subtitle "Kill someone!!"
execute if score ?round exact.state matches 11 run title @a[tag=!exact.win] subtitle "Touch grass!!"
execute if score ?round exact.state matches 12 run title @a[tag=!exact.win] subtitle "Break the shovel!!"
execute if score ?round exact.state matches 13 run title @a[tag=!exact.win] subtitle "Make rabbit stew!!"
execute if score ?round exact.state matches 14 run title @a[tag=!exact.win] subtitle "Take damage!!"
execute if score ?round exact.state matches 15 run title @a[tag=!exact.win] subtitle "Launch 11 blocks up!!"
execute if score ?round exact.state matches 16 run title @a[tag=!exact.win] subtitle "BOSS GAME: Pig racing!!"

title @a[tag=exact.win] title {"text":"SUCCESS","color":"green","bold":true}

# Check if task duration (400 ticks) has passed
execute if score ?phase_timer exact.timer matches 400.. run function exact:state/ingame_task/exit
