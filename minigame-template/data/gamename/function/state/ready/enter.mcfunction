# ============================================================
# gamename:state/ready/enter
# Called by: gamename:on/gamestart, gamename:state/break/tick
# Executor:  Server
#
# Starts the 15-second ready countdown before gameplay.
# ============================================================

scoreboard players set ?phase gamename.state 0
scoreboard players set ?phase_timer gamename.timer 0

title @a title {"text":"Get Ready","color":"yellow","bold":true}
title @a subtitle {"text":"Round starts in 15 seconds","color":"gold"}
