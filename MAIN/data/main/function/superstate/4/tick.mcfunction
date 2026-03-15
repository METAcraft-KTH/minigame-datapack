# ============================================================
# Called by: _tick (each tick, state 4)
# Executor:  Server
# 
# Runs every tick when the current minigame is in its
# outro phase. Display some postgame statistics and get
# ready to boot everyone back to lobby (superstate 1).
# 
# ============================================================

# --- FORCE EVERYONE TO SPECTATE ---
execute as @a[gamemode=!spectator] run gamemode spectator @s

# --- DECREMENT TIMER ---
scoreboard players remove ?supertimer main.time 1