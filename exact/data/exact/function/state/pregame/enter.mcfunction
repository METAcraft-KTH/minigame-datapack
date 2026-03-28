# ============================================================
# exact:state/pregame/enter
# Called once when entering pregame phase
# Set up pregame state (15 seconds = 300 ticks)
# ============================================================

title @a clear
subtitle @a {"text":""}
title @a {"text":"Get ready!","color":"yellow"}

scoreboard players set ?phase_timer exact.timer 0
