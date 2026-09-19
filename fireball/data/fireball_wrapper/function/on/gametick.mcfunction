# ============================================================
# fireball:on/gametick
# Called by: main:private/call/gametick
# Executor:  Server
#
# Runs every tick while the game is running.
# ============================================================

# MAIN ticks us from the overworld. Every selector under here is an
# @e / @n / @p lookup for the ball and its passengers, and those only
# ever see the execution dimension, so the arena's dimension is
# entered once at this door instead of on 15 separate lines in ball/.
function fireball:api/tick
