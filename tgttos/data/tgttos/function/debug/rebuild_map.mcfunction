# ============================================================
# tgttos:debug/rebuild_map
# Called by: an operator, by hand
# Executor:  Server
#
# Puts both control points and both platforms back to their
# neutral state. Safe mid-game — but it repaints the floors
# white, so the ownership colours will be out of step with
# ?own1 / ?own2 until each point next changes hands.
# ============================================================

forceload add 19940 59960 20060 60140
function tgttos:map/setup
say [tgttos] map rebuilt
