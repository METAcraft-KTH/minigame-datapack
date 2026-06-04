# ============================================================
# gamename:state/break/enter
# Called by: gamename:state/play/tick
# Executor:  Server
#
# Starts the 30-second break between gameplay rounds.
# ============================================================

scoreboard players set ?phase gamename.state 2
scoreboard players set ?phase_timer gamename.timer 0

execute as @a[tag=!admin] run gamemode spectator

title @a title {"text":"Break Time","color":"aqua","bold":true}
title @a subtitle {"text":"Next round soon...","color":"white"}
