# warn-off target-selector-no-dimension
execute as @e[tag=fireball,tag=root,type=item_display] at @s run function fireball:ball/tick


#execute as Raxo2004 at @s run tp @n[type=minecraft:block_display] ^ ^ ^10
effect give @a[predicate=fireball:valid_target] saturation 10 0 true


# spawn fireballs on an interval
execute if score #game_time fireball matches 1.. run function fireball:gameplay/game_tick