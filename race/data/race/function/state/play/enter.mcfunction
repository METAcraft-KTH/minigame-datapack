# ============================================================
# race:state/play/enter
# Called by: race:state/ready/tick
# Executor:  Server
# ============================================================
# Initialize the play phase.

scoreboard players set ?phase race.state 1
scoreboard players set ?phase_timer race.timer 0
scoreboard players set ?match_timer race.timer 0

title @a[tag=race.playing] title {"text":"GO!","color":"green","bold":true}
title @a[tag=race.playing] subtitle ""
