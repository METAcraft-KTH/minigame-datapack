# ============================================================
# exact:on/gametick
# Called by: main:private/call/gametick
# Executor:  Server
#
# Runs every tick while the game is running (superstate 3).
# Main dispatcher for phase logic.
# ============================================================

# Hearts are the life counter for the elimination, so nothing except this
# pack's own /damage may move a health bar. Resistance 5 is a flat 100%
# reduction, and out_of_world (the damage type exact deals hearts with) is
# the one type that bypasses it. Saturation keeps hunger out of it too.
# This lives here rather than in a phase tick so there is no phase, and no
# transition tick, where somebody is briefly unprotected. The 5 second
# duration is deliberately short and refreshed every tick: if this game is
# ever force-ended from outside, the effects lapse on their own instead of
# following players into the next one.
effect give @a[tag=!admin] minecraft:resistance 5 4 true
effect give @a[tag=!admin] minecraft:saturation 5 0 true

# Increment phase timer
scoreboard players add ?phase_timer exact.timer 1

# Dispatch to phase-specific tick functions
execute if score ?phase exact.state matches 0 run function exact:state/pregame/tick
execute if score ?phase exact.state matches 1 run function exact:state/ingame_task/tick
execute if score ?phase exact.state matches 2 run function exact:state/ingame_wait/tick
