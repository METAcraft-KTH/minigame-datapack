# ============================================================
# exact:state/pregame/tick
# Called every tick during pregame phase (15 seconds = 300 ticks)
# ============================================================

# Check if pregame duration (300 ticks) has passed
execute if score ?phase_timer exact.timer matches 300.. run function exact:state/pregame/exit

# You can add countdown display here if desired
bossbar set exact:timer players @a
bossbar set exact:timer name "Awaiting instructions..."
bossbar set exact:timer max 300
execute store result bossbar exact:timer value run scoreboard players get ?phase_timer exact.timer