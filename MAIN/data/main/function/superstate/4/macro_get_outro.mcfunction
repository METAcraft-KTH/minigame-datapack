# ============================================================
# Called by: main:superstate/4/tick (once, after 2 seconds)
# Executor:  Server
# 
# Grabs the list of leaderboards to display in the outro.
# 
# ============================================================

$data modify storage main:temp gamename set value "$(gamename)"
#   clear first, so a game without an outro config doesn't show the previous game's slides
data remove storage main:temp stats
$data modify storage main:temp stats set from storage main:outro $(namespace).stats