# ============================================================
# exact:state/ingame_wait/tick
# Called every tick during wait phase
# Count down and check for phase transition
# (10 seconds = 200 ticks)
# ============================================================

# Check if wait duration (200 ticks) has passed
execute if score ?phase_timer exact.timer matches 200.. run function exact:state/ingame_wait/exit
