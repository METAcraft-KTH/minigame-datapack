# ============================================================
# tf:state/pregame/enter
# Called by: tf:on/gamestart
# Executor:  Server
#
# Starts the 20-second pregame countdown.
# ============================================================

scoreboard players set ?phase tf.state 0
scoreboard players set ?phase_timer tf.timer 0

title @a title {"text":"Mingle","color":"gold","bold":true}
title @a subtitle {"text":"Round 1 starts in 20 seconds","color":"yellow"}
