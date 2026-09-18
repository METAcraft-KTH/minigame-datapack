# ============================================================
# walls:state/fight/enter
# Called by: walls:state/drop/tick (once)
# Executor:  Server
#
# Phase 2: open map. Runs until one team has lost both ravagers.
# ============================================================

scoreboard players set ?phase walls.state 2

# first evoker lands the moment the wall does, then every 3 minutes
function walls:evoker/spawn
