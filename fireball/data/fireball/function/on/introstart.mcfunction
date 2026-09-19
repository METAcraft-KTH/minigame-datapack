# ============================================================
# fireball:on/introstart
# Called by: main:superstate/2/macro_intro (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 2.
# Loads the arena while everybody is watching the cutscene.
# ============================================================

# No result yet. fireball:gameplay/victory_data / victory_it / game_over
# overwrite this, and fireball:gameplay/finish reads it to pick which
# main:api/end_game_* to hand off to. 0 = nobody won.
scoreboard players set #winner fireball 0

# The whole playfield has to stay loaded for the whole game. The
# fireball is an item_display walking itself forward one step at a
# time, and a ball that drifts into an unloaded chunk stops ticking
# and never comes back. Nobody stands in the middle either, so the
# lava field between the platforms has no player keeping it up.
#
# X 49950..50050, Z 59940..60060 is chunks 3121..3128 by 3746..3753,
# 64 chunks — well under forceload's 256 chunk per command cap.
forceload add 49950 59940 50050 60060
