# ============================================================
# exact:state/ingame_wait/enter
# Called once when entering the wait phase
# Show results and award points (10 seconds = 200 ticks)
# ============================================================

# Clear inventories between rounds (matches old exact behavior)
clear @a[tag=!admin]
effect clear @a[tag=!admin]

# Round cleanup carried over from old exact
fill 50007 99 50007 49993 99 49993 iron_block
execute positioned 50000 100 50000 run tp @e[type=!player,distance=..100] 50000 -10 50050
#execute if score ?round exact.state matches 5 run tp @a[tag=!admin] @n[type=marker,tag=exact.tp.arena]
#execute if score ?round exact.state matches 6 run tp @a[tag=!admin] @n[type=marker,tag=exact.tp.arena]
execute if score ?round exact.state matches 7 run fill 49984 126 49984 50016 99 50016 air replace stone_bricks
execute if score ?round exact.state matches 11 run fill 49984 126 49984 50016 99 50016 air replace stone_bricks
#execute if score ?round exact.state matches 9 run time set noon
#execute if score ?round exact.state matches 9 at @n[type=marker,tag=exact.tp.arena] run fill ~30 ~3 ~30 ~-30 ~-2 ~-30 air replace #beds
#execute if score ?round exact.state matches 11 run team leave @a[team=exact.temp]
#execute if score ?round exact.state matches 14 at @n[type=marker,tag=exact.tp.arena] run tp @a[tag=!admin,distance=..100] ~ ~ ~
#execute if score ?round exact.state matches 15 at @n[type=marker,tag=exact.tp.arena] run kill @e[type=vex,distance=..100]

title @a times 0 60 40
title @a[tag=exact.win] title {"text":"SUCCESS","color":"green","bold":true}
title @a[tag=!exact.win] title {"text":"FAILURE","color":"red","bold":true}

# Players with exact.win tag see nothing (already showed SUCCESS)
# Award points to winners
execute as @a[tag=exact.win] run scoreboard players add @s exact.stats.wins 1

# Reset phase timer
scoreboard players set ?phase_timer exact.timer 0
