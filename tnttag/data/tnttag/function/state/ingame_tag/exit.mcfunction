# ============================================================
# tnttag:state/ingame_task/exit
# Transition from ingame_task to ingame_wait
# ============================================================

scoreboard players set ?phase tnttag.state 2
scoreboard players set ?phase_timer tnttag.timer 0

function tnttag:state/ingame_wait/enter
