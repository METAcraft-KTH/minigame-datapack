# ============================================================
# tnttag:state/pregame/enter
# Called once when entering pregame phase
# Set up pregame state (15 seconds = 300 ticks)
# ============================================================

function main:util/reset_gamerules
gamerule fall_damage false
gamerule natural_health_regeneration true
difficulty normal

scoreboard players set ?phase_timer tnttag.timer 0