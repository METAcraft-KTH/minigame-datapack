effect give @s minecraft:instant_health 1 50
effect give @s minecraft:saturation 1 255
effect clear @s
clear @s
experience set @s 0 levels
experience set @s 0 points
give @s shears[can_break={blocks:"red_wool"}] 1
item replace entity @s armor.head with black_concrete[minecraft:enchantments={binding_curse:1},minecraft:attribute_modifiers=[{type:"jump_strength",amount:-1,id:"sg:no_jump",operation:add_multiplied_total},{type:"movement_speed",amount:-1,id:"sg:no_move",operation:add_multiplied_total}]]

function survivalgames:selector/join_random_smallest_lobby
