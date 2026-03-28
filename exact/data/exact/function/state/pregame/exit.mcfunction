# ============================================================
# exact:state/pregame/exit
# Transition from pregame to ingame_task
# ============================================================

title @a clear
subtitle @a {"text":""}

scoreboard players set ?phase exact.state 1
scoreboard players set ?phase_timer exact.timer 0

function exact:state/ingame_task/enter
