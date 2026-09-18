# ============================================================
# walls:on/introstart
# Called by: main:superstate/2/macro_intro (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 2.
# Builds the map's entities while everybody is watching the
# intro cutscene.
# ============================================================

# The whole 256x256 arena stays loaded for the entire game.
# Without this, the wall fill and the warden lookups silently
# fail whenever a corner has nobody standing in it.
forceload add 29872 59872 30128 60128

# wipe anything left behind by a previous run / reload
kill @e[type=warden,tag=walls.warden]
kill @e[type=villager,tag=walls.shop]
kill @e[type=iron_golem,tag=walls.golem]

function walls:map/setup
