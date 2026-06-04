# ============================================================
# tnttag:state/ingame_wait/enter
# Called once when entering the wait phase
# Show results and award points (10 seconds = 200 ticks)
# ============================================================

# Clear inventories between rounds (matches old tnttag behavior)
clear @a[tag=!admin]
effect clear @a[tag=!admin]

# EXPLODEEEEEE
tag @a remove tnttag.died
execute at @a[tag=!admin,team=tnttag.has_tnt] run summon creeper ~ ~1 ~ {Fuse:0}
# also kill people who didnt evacuate
execute at @a[tag=!admin,tag=tnttag.not_evacuated] run summon creeper ~ ~1 ~ {Fuse:0}

# Reset phase timer
scoreboard players set ?phase_timer tnttag.timer 0
