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

# --- INCREMENT TIMER (works same as superstate 2) ---
scoreboard players add ?supertimer main.time 1


# TODO display postgame stats


# --- DISPLAY SCREEN TRANSITION TITLE ---
# these values are just temporary until i figure out postgame stats
#   the timing is really long because lagspike
execute if score ?supertimer main.time matches 101 run title @a times 20 999999 0
execute if score ?supertimer main.time matches 101 run title @a title {"text":"ABA","font":"hexathlon:font","shadow_color":0}

# --- JUST BEFORE WE RETURN TO STATE 1, DISABLE THE CURRENT MINIGAME DATAPACK AND ENABLE THE NEXT ---
execute if score ?supertimer main.time matches 122 run function main:superstate/4/change_datapack

# --- RETURN
execute if score ?supertimer main.time matches 123 unless score ?minigame_id main.state matches 6 run function main:superstate/4/go_to_state_1
execute if score ?supertimer main.time matches 123 if score ?minigame_id main.state matches 6 run function main:superstate/4/go_to_state_5
