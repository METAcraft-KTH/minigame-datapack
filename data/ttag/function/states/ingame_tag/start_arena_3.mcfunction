# set new config values
scoreboard players set time.ingame_tag ttag.config 1500
scoreboard players set num.bomb ttag.config 35

tellraw @a ["",{"text":"⚠ EVACUATE! ","color":"yellow","bold":true},"Get to the next arena before the round ends! Follow the",{"text":"red beacon beam","color":"red"},"!\n"]

title @a times 20 80 40
title @a title {"text":"⚠ EVACUATE! ⚠","color":"yellow","bold":true}
title @a title ["Follow the",{"text":"red beacon beam","color":"red"}," to the next arena!\n"]

# replace blocks
execute at @n[tag=ttag.arena2.beacon] run setblock ~ ~ ~ red_stained_glass
execute at @n[tag=ttag.arena2.beacon] run fill ~10 ~10 ~10 ~-10 ~-10 ~-10 air replace deepslate_tiles

# set spawn
execute at @n[tag=ttag.arena3.spawn] run setworldspawn ~ ~ ~ 0