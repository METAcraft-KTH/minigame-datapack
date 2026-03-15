# ============================================================
# Called by: main:superstate/2/tick (per tick, when showing slides)
# Executor:  Server
# 
# Tick function while slides are being shown
# (?supertimer main.time >= ?event.start_showing_howtoplay main.time)
# 
# ============================================================

# --- INCREMENT TIMER ---
scoreboard players add ?slidetimer main.time 1
execute if score ?slidetimer main.time matches 100.. run scoreboard players set ?slidetimer main.time 0

# --- WHEN ON 0, SHOW NEXT SLIDE (or go to state 3 if out of slides) ---
execute if score ?slidetimer main.time matches 0 run function main:superstate/2/show_next_slide