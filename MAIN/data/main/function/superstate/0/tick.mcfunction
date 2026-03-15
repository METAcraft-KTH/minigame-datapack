# ============================================================
# Called by: _tick (each tick, state 0)
# Executor:  Server
# 
# Runs per tick until the event itself actually starts.
# 
# There is no timer in this superstate; instead, we wait
# for at least 15 players online before we start ticking
# down to Game 1.
# 
# ============================================================

# --- CHECK HOW MANY PLAYERS ONLINE ---
execute store result score #playercount main.temp if entity @a[tag=!admin]

# --- IF THAT NUMBER IS BIGGER THAN 15, GO TO SUPERSTATE 1
execute if score #playercount main.temp >= ?launch_wait_for_player_count main.const run function main:superstate/0/go_to_state_1