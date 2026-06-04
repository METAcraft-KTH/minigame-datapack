# ============================================================
# tnttag:state/ready/enter
# Called by: tnttag:on/gamestart, tnttag:state/break/tick
# Executor:  Server
#
# Starts the 15-second ready countdown before gameplay.
# ============================================================

scoreboard players set ?phase tnttag.state 0
scoreboard players set ?phase_timer tnttag.timer 0

title @a title {"text":"Get Ready","color":"yellow","bold":true}
title @a subtitle {"text":"Round starts in 15 seconds","color":"gold"}
