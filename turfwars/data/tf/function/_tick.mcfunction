# ============================================================
# tf:_tick
# Called by: tf:on/gametick
# Executor:  Server
#
# Internal state dispatcher for the active minigame.
# ============================================================

scoreboard players add ?match_timer tf.timer 1

execute if score ?phase tf.state matches 0 run function tf:state/pregame/tick
execute if score ?phase tf.state matches 1 run function tf:state/ingame_run/tick
execute if score ?phase tf.state matches 2 run function tf:state/ingame_wait/tick
