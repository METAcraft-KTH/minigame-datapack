# ============================================================
# splat:on/gametick
# Called by: main:private/call/gametick
# Executor:  Server
#
# Runs every tick while superstate is 3.
# All gameplay lives in the mod, so there is nothing to do here
# except keep the flag raised.
# ============================================================

scoreboard players set ?running splat.state 1
