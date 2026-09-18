# ============================================================
# exact:state/ingame_wait/enter
# Called once when entering the wait phase (120 ticks)
#
# Shows the round result and undoes whatever the task just
# changed, so the next ingame_task/enter starts from a clean
# iron platform. Keyed on ?task -- the task that just ran.
# ============================================================

# Clear inventories between rounds
clear @a[tag=!admin]
effect clear @a[tag=!admin]

# Restore the platform and sweep away every mob the task spawned
fill 50007 99 50007 49993 99 49993 iron_block
execute positioned 50000 100 50000 run tp @e[type=!player,distance=..100] 50000 -10 50050

# Task 8: remove the hay cube and any fire still on it
execute if score ?task exact.state matches 8 run fill 50002 105 50002 49998 101 49998 air

# Task 9: restore the concrete powder floor. Blocks that were lit are air now,
# so the leftover TNT and those gaps both have to be filled back in.
execute if score ?task exact.state matches 9 run fill 49981 98 49981 50019 98 50019 light_gray_concrete_powder replace tnt
execute if score ?task exact.state matches 9 run fill 49981 98 49981 50019 98 50019 light_gray_concrete_powder replace air

# Task 10: fall damage is off for every other task
execute if score ?task exact.state matches 10 run gamerule fall_damage false

# Task 14: clear the bee nest layer players were standing on
execute if score ?task exact.state matches 14 run fill 50007 100 50007 49993 100 49993 air

# Task 23: take the grass island back down (the water platform is already
# covered by the iron_block fill above)
execute if score ?task exact.state matches 23 run fill 49984 126 49984 50016 99 50016 air replace grass_block

# Task 24: bring everyone back from the obstacle course
execute if score ?task exact.state matches 24 run tp @a[tag=!admin] 50000 100 50000

# Task 25: put the concrete powder floor back. Any crops left standing on the
# farmland go with the iron_block platform fill above.
execute if score ?task exact.state matches 25 run fill 49981 98 49981 50019 98 50019 light_gray_concrete_powder replace crafting_table

title @a times 0 60 40
title @a[tag=exact.win] title {"text":"SUCCESS","color":"green","bold":true}
title @a[tag=!exact.win] title {"text":"FAILURE","color":"red","bold":true}

# Reset phase timer
scoreboard players set ?phase_timer exact.timer 0
