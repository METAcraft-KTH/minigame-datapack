# ============================================================
# exact:state/pregame/enter
# Called once when entering pregame phase
# Set up pregame state (15 seconds = 300 ticks)
# ============================================================

function main:util/reset_gamerules
gamerule fall_damage false

# Hearts are the elimination counter, so the only things allowed to move a
# health bar are this pack's own /damage and the winner's regeneration.
# reset_gamerules already turns this off; it is spelled out here because the
# whole game format falls apart if it is ever on.
gamerule natural_health_regeneration false

scoreboard players set ?phase_timer exact.timer 0


bossbar add exact:timer ""