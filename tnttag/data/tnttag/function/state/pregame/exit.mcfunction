# ============================================================
# tnttag:state/pregame/exit
# Transition from pregame to ingame_task
# ============================================================

title @a clear

scoreboard players set ?phase tnttag.state 1
scoreboard players set ?phase_timer tnttag.timer 0

function tnttag:state/ingame_tag/enter