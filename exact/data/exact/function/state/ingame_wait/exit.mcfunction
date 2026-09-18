# ============================================================
# exact:state/ingame_wait/exit
# Transition from ingame_wait to next phase
#
# There is no fixed number of rounds any more: the game runs
# until the elimination leaves one team (or one player) standing.
# Every elimination from this round has been processed by now --
# the hearts came off at the start of the wait phase, and MAIN
# reported the resulting deaths on the tick after that.
# ============================================================

# Remove win tags from all players before next round
tag @a remove exact.win

# Ends the game and returns 1 when only one side is left standing
execute if function exact:state/end/check run return 0

# Otherwise, advance to next round and restart task phase
scoreboard players add ?round exact.state 1
scoreboard players set ?phase exact.state 1
scoreboard players set ?phase_timer exact.timer 0
function exact:state/ingame_task/enter
