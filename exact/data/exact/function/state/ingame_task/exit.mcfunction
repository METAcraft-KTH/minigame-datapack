# ============================================================
# exact:state/ingame_task/exit
# Transition from ingame_task to ingame_wait
# ============================================================

title @a clear
subtitle @a {"text":""}

scoreboard players set ?phase exact.state 2
scoreboard players set ?phase_timer exact.timer 0

function exact:state/ingame_wait/enter
