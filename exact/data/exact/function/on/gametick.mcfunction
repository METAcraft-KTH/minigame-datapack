# ============================================================
# exact:on/gametick
# Called by: main:private/call/gametick
# Executor:  Server
#
# Runs every tick while the game is running (superstate 3).
# Main dispatcher for phase logic.
# ============================================================

# Increment phase timer
scoreboard players add ?phase_timer exact.timer 1

# Dispatch to phase-specific tick functions
execute if score ?phase exact.state matches 0 run function exact:state/pregame/tick
execute if score ?phase exact.state matches 1 run function exact:state/ingame_task/tick
execute if score ?phase exact.state matches 2 run function exact:state/ingame_wait/tick
