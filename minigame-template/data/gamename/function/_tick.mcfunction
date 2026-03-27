# ============================================================
# Called by: gamename:on/gametick
# Executor:  Server
# 
# Runs every tick while the game is running (superstate 3).
# 
# ============================================================

# Total time spent inside superstate 3
scoreboard players add ?match_timer gamename.timer 1

# Phase dispatch
execute if score ?phase gamename.state matches 0 run function gamename:state/ready/tick
execute if score ?phase gamename.state matches 1 run function gamename:state/play/tick
execute if score ?phase gamename.state matches 2 run function gamename:state/break/tick