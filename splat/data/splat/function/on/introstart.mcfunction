# ============================================================
# splat:on/introstart
# Called by: main:superstate/1/macro_get_intro (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 2.
# ============================================================

# The game is not running yet, only the intro cutscene is.
scoreboard players set ?running splat.state 0

# Wipe last run's stats so the outro leaderboards start clean.
scoreboard players reset * splat.stats.blocks
scoreboard players reset * splat.stats.kills
