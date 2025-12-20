tp @s @n[tag=atc.tp.seekerspawn]
effect give @s blindness infinite 0 true
effect give @s slowness infinite 255 true
effect give @s resistance infinite 5 true
title @s title {"text": "You are the first seeker!", "color": "dark_purple"}
title @s subtitle {"text": "You will become a hider when you get your first kill!", "color": "green"}
tellraw @s {"text": "You are the first seeker!", "color": "dark_purple"}
tellraw @s {"text": "You will become a hider when you get your first kill!", "color": "green"}
item replace entity @s armor.head with black_concrete[minecraft:equippable={slot:head,camera_overlay:"minecraft:block/black_concrete"},minecraft:enchantments={binding_curse:1},minecraft:attribute_modifiers=[{type:"jump_strength",amount:-1,id:"atc:no_jump",operation:add_multiplied_total},{type:"movement_speed",amount:-1,id:"atc:no_move",operation:add_multiplied_total}]]
