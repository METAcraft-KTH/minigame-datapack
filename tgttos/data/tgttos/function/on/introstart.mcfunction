# ============================================================
# tgttos:on/introstart
# Called by: main:superstate/2/macro_intro (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 2.
# Loads the arena and rebuilds the map while everybody is
# watching the intro cutscene.
# ============================================================

# No result yet. tgttos:end/win_data / win_it / draw
# overwrite this, and tgttos:end/finish reads it to pick which
# main:api/end_game_* to hand off to. 0 = nobody won.
scoreboard players set #winner tgttos.state 0

# The arena has to stay loaded for the whole game: the two control
# points are 50 blocks apart with nobody standing between them for
# most of the match, and an unloaded marker means the capture tick
# silently stops counting.
#
# X 19940..20060, Z 59960..60140 is chunks 1246..1253 by 3747..3758,
# 96 chunks — well under forceload's 256 chunk per command cap.
forceload add 19940 59960 20060 60140

# Chunks from a forceload finish loading over the next few ticks,
# and the markers need to be selectable, so give the arena a second
# to come up before building on it.
schedule function tgttos:map/setup 20t replace
