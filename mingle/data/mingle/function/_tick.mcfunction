# ============================================================
# mingle:_tick
# Called by: mingle:on/gametick
# Executor:  Server
#
# Internal state dispatcher for the active minigame.
# ============================================================

scoreboard players add ?match_timer mingle.timer 1

execute if score ?phase mingle.state matches 0 run function mingle:state/pregame/tick
execute if score ?phase mingle.state matches 1 run function mingle:state/ingame_run/tick
execute if score ?phase mingle.state matches 2 run function mingle:state/ingame_wait/tick
