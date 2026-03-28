# ============================================================
# race:state/ready/enter
# Called by: race:on/gamestart
# Executor:  Server
# ============================================================
# Initialize the ready phase.

scoreboard players set ?phase race.state 0
scoreboard players set ?phase_timer race.timer 0
