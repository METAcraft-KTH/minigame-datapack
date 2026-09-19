# ============================================================
# exact:state/ingame_wait/enter
# Called once when entering the wait phase (120 ticks)
#
# Shows the round result and undoes whatever the task just
# changed, so the next ingame_task/enter starts from a clean
# iron platform. Keyed on ?task -- the task that just ran.
# ============================================================

# --- SETTLE THE ROUND ---
# Everybody still in the game who did not finish the task loses a heart.
# out_of_world is the damage type in #bypasses_resistance, so the resistance 5
# from exact:on/gametick does not soak it up. Running out of hearts kills the
# player, and MAIN reports that to exact:on/player/death, which eliminates
# them -- that lands next tick, so the end-of-game check waits until the wait
# phase is over (exact:state/ingame_wait/exit).
execute as @a[tag=!admin,tag=!exact.dead,tag=!exact.win] run damage @s 2 minecraft:out_of_world

# Mark the round as settled for everyone who was here for it, so players who
# disconnect now get charged for it on their way back in (exact:util/catchup).
execute as @a[tag=!admin,tag=!exact.dead] run scoreboard players operation @s exact.lastround = ?round exact.state

# Clear inventories between rounds
clear @a[tag=!admin]
effect clear @a[tag=!admin]

# Restore the platform and sweep away every mob the task spawned. Players get
# dismounted first: teleporting a vehicle takes its passengers along, so anyone
# riding a pig would be carried out of bounds with it.
execute as @a run ride @s dismount
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

# Task 24: turn the elytra course back into waxed copper grate
execute if score ?task exact.state matches 24 run fill 50028 114 49971 49971 114 50028 waxed_copper_grate replace grass_block

# Tasks 15 and 25: block drops are off again for every other task
execute if score ?task exact.state matches 15 run gamerule block_drops false
execute if score ?task exact.state matches 25 run gamerule block_drops false

# Task 25: put the concrete powder floor back. Any crops left standing on the
# farmland go with the iron_block platform fill above.
execute if score ?task exact.state matches 25 run fill 49981 98 49981 50019 98 50019 light_gray_concrete_powder replace crafting_table

title @a times 0 60 40
title @a[tag=exact.win] title {"text":"SUCCESS","color":"green","bold":true}
title @a[tag=!exact.win,tag=!exact.dead] title {"text":"FAILURE","color":"red","bold":true}
title @a[tag=!exact.win,tag=!exact.dead] subtitle {"text":"-1 heart","color":"red"}

# Reset phase timer
scoreboard players set ?phase_timer exact.timer 0
