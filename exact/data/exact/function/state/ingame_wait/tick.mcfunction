# ============================================================
# exact:state/ingame_wait/tick
# Called every tick during wait phase
# Count down and check for phase transition
# (6 seconds = 120 ticks)
# ============================================================

# Check if wait duration (120 ticks) has passed
execute if score ?phase_timer exact.timer matches 120.. run function exact:state/ingame_wait/exit

# countdown
bossbar set exact:timer players @a
bossbar set exact:timer color white
bossbar set exact:timer name "Awaiting instructions..."
bossbar set exact:timer max 120
bossbar set exact:timer value 000