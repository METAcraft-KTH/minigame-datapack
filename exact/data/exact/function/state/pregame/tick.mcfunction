# ============================================================
# exact:state/pregame/tick
# Called every tick during pregame phase (15 seconds = 300 ticks)
# ============================================================

# Check if pregame duration (300 ticks) has passed
execute if score ?phase_timer exact.timer matches 300.. run function exact:state/pregame/exit

# You can add countdown display here if desired
