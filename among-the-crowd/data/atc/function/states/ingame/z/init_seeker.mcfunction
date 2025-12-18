tp @s @n[tag=atc.tp.seekerspawn]
give @s diamond_sword
title @s title {"text": "You are now a seeker!"}
title @s subtitle {"text": "Go kill the hiders!"}
tellraw @s {"text": "You are now a seeker!"}
effect give @s saturation infinite 0 true
