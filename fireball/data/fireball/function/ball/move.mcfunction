# called on the root



scoreboard players operation #i temp = @s fireball.step_count

# no valid targets, dont turn
execute unless entity @a[predicate=fireball:valid_target] rotated as @n[tag=fireball,tag=direction,distance=..10,type=item_display] run return run function fireball:ball/move_step with entity @s data

# phase 1 (slow turning)
execute if score @s fireball.wack_age matches ..20 run return run execute rotated as @n[tag=fireball,tag=direction,distance=..10,type=item_display] positioned ^ ^ ^-10 facing entity @p[predicate=fireball:valid_target,tag=fireball.target] eyes positioned ^ ^ ^-1 facing entity @s feet positioned as @s run function fireball:ball/move_step with entity @s data

# phase 2 (faster turning)
execute if score @s fireball.wack_age matches 21.. unless entity @p[distance=..6,predicate=fireball:valid_target] run return run execute rotated as @n[tag=fireball,tag=direction,distance=..10,type=item_display] positioned ^ ^ ^-10 facing entity @p[predicate=fireball:valid_target,tag=fireball.target] eyes positioned ^ ^ ^-5 facing entity @s feet positioned as @s run function fireball:ball/move_step with entity @s data

# phase 3 (fastest turning, target feet)
return run execute rotated as @n[tag=fireball,tag=direction,distance=..10,type=item_display] positioned ^ ^ ^-5 facing entity @p[predicate=fireball:valid_target,tag=fireball.target] feet positioned ^ ^ ^-10 facing entity @s feet positioned as @s run function fireball:ball/move_step with entity @s data

