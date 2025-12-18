tp @s @n[tag=atc.tp.seekerspawn]
give @s diamond_sword
title @s title {"text": "You are now a seeker!", "color": "red"}
title @s subtitle {"text": "Go kill the hiders!", "color": "red"}
tellraw @s {"text": "You are now a seeker!", "color": "red"}
effect give @s saturation infinite 0 true
