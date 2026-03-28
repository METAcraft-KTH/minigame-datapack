# ============================================================
# exact:state/pregame/enter
# Called once when entering pregame phase
# Set up pregame state (15 seconds = 300 ticks)
# ============================================================

function main:util/reset_gamerules
gamerule fall_damage false

scoreboard players set ?phase_timer exact.timer 0


bossbar add exact:timer ""