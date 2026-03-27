# ============================================================
# spleef:on/introstart
# Called by: main:superstate/1/macro_get_intro
# Executor:  Server
# ============================================================

# Ensure arena anchor exists before game start.
scoreboard players set ?colors spleef.game 3
function spleef:utility/map/place