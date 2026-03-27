# ============================================================
# Called by: main:private/call/gametick
# Executor:  Server
# 
# Runs every tick while the game is running.
# 
# ============================================================

execute if score ?state uhc.state matches 0 run function uhc:state/battlebus/tick
execute if score ?state uhc.state matches 1 run function uhc:state/playing/tick
