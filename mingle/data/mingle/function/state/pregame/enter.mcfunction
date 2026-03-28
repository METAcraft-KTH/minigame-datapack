# ============================================================
# mingle:state/pregame/enter
# Called by: mingle:on/gamestart
# Executor:  Server
#
# Starts the 20-second pregame countdown.
# ============================================================

scoreboard players set ?phase mingle.state 0
scoreboard players set ?phase_timer mingle.timer 0

title @a title {"text":"Mingle","color":"gold","bold":true}
title @a subtitle {"text":"Round 1 starts in 20 seconds","color":"yellow"}
