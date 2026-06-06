# ============================================================
# Called by: tf:on/gametick
# Executor:  Server
# 
# Runs every tick while the game is running (superstate 3).
# 
# ============================================================

# Total time spent inside superstate 3
scoreboard players add ?match_timer tf.timer 1

# Phase dispatch
execute if score ?phase tf.state matches 0 run function tf:state/ready/tick
execute if score ?phase tf.state matches 1 run function tf:state/play/tick
execute if score ?phase tf.state matches 2 run function tf:state/break/tick