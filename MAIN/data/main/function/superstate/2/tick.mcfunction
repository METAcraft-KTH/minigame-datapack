# ============================================================
# Called by: _tick
# Executor:  Server
# 
# Runs per tick when the intro cutscene is playing.
# 
# ============================================================

# --- FORCE EVERYONE TO WATCH CUTSCENE ---
execute as @a[gamemode=!spectator] run gamemode spectator @s
execute as @a[gamemode=!spectator] run spectate @n[type=block_display,tag=]

# --- DECREMENT TIMER ---
scoreboard players remove ?superstate main.time 1