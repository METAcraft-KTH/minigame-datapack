# ============================================================
# Called by: main:private/call/gamestart
# Executor:  Server
# 
# Runs ONCE: on the tick when superstate changes to 3,
# and the control is fully handed over to this
# minigame datapack.
# 
# ============================================================

say gamestart
scoreboard players set ?round uhc.state 1
function uhc:state/start_round