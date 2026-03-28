# ============================================================
# race:on/gametick
# Called by: main:private/call/gametick (every tick)
# Executor:  Server
# ============================================================
# Main game loop during superstate 3.

# Dispatch to current phase
execute if score ?phase race.state matches 0 run function race:state/ready/tick
execute if score ?phase race.state matches 1 run function race:state/play/tick
execute if score ?phase race.state matches 2 run function race:state/break/tick

# Check for players who finished and update stats
execute as @a[tag=race.playing,tag=race.finished] run function race:award/finish
