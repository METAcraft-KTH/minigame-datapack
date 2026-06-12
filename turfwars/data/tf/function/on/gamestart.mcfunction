# ============================================================
# tf:on/gamestart
# Called by: main:private/call/gamestart
# Executor:  Server
#
# Runs once when superstate changes to 3.
# ============================================================

scoreboard players set ?phase tf.state 0
scoreboard players set ?phase_timer tf.timer 0
scoreboard players set ?round tf.state 0
scoreboard players set ?match_timer tf.timer 0
scoreboard players set ?target_group tf.state 0

execute as @a[tag=!admin] run gamemode adventure

function tf:state/pregame/enter
