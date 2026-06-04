# ============================================================
# tnttag:state/ingame_wait/exit
# Transition from ingame_wait to next phase
# Check if round 16 has completed; if yes, end game
# Otherwise, increment round and return to ingame_task
# ============================================================

# if that was the last round, end game
execute if score ?round tnttag.state matches 20 run return run function main:api/end_game

# otherwise, advance to next round and go again
scoreboard players set ?phase_timer tnttag.timer 0
scoreboard players set ?phase tnttag.state 1
function tnttag:state/ingame_tag/enter