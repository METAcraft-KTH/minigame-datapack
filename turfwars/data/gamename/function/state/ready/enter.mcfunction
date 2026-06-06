# ============================================================
# tf:state/ready/enter
# Called by: tf:on/gamestart, tf:state/break/tick
# Executor:  Server
#
# Starts the 15-second ready countdown before gameplay.
# ============================================================

scoreboard players set ?phase tf.state 0
scoreboard players set ?phase_timer tf.timer 0

title @a title {"text":"Get Ready","color":"yellow","bold":true}
title @a subtitle {"text":"Round starts in 15 seconds","color":"gold"}
