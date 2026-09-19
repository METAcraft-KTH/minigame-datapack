# ============================================================
# walls:state/fight/enter
# Called by: walls:state/drop/tick (once)
# Executor:  Server
#
# Phase 2: open map. Runs until one team has lost both ravagers.
# ============================================================

scoreboard players set ?phase walls.state 2

# the wall is gone, so the mid evoker spawner can go in its place
function walls:evoker/place
