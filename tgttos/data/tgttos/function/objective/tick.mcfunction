# ============================================================
# tgttos:objective/tick
# Called by: tgttos:_tick
# Executor:  Server
#
# The objective timers and the win check.
#
# A team's 3:00 only runs while they hold BOTH points, so the
# bar is a record of how long they have had the map locked down
# rather than of how long the match has gone on. Both teams
# cannot hold both points at once, so only one bar ever moves.
#
# The overtime rule ("0:00 AND both points") is checked on its
# own rather than folded into the countdown, so losing a point
# on the same tick the timer would have run out does not win
# the game — you have to be holding both when it lands.
# ============================================================

scoreboard players set #data_holds tgttos.temp 0
scoreboard players set #it_holds tgttos.temp 0
execute if score ?own1 tgttos.state matches 1 if score ?own2 tgttos.state matches 1 run scoreboard players set #data_holds tgttos.temp 1
execute if score ?own1 tgttos.state matches 2 if score ?own2 tgttos.state matches 2 run scoreboard players set #it_holds tgttos.temp 1

# --- COUNTDOWN ---
execute if score #data_holds tgttos.temp matches 1 if score ?t_data tgttos.timer matches 1.. run scoreboard players remove ?t_data tgttos.timer 1
execute if score #it_holds tgttos.temp matches 1 if score ?t_it tgttos.timer matches 1.. run scoreboard players remove ?t_it tgttos.timer 1

execute store result bossbar tgttos:data value run scoreboard players get ?t_data tgttos.timer
execute store result bossbar tgttos:it value run scoreboard players get ?t_it tgttos.timer

# --- LAST CALL ---
execute if score ?t_data tgttos.timer matches ..200 if score ?warn_data tgttos.state matches 0 run function tgttos:objective/warn_data
execute if score ?t_it tgttos.timer matches ..200 if score ?warn_it tgttos.state matches 0 run function tgttos:objective/warn_it

# --- WIN CHECK ---
execute if score ?t_data tgttos.timer matches 0 if score #data_holds tgttos.temp matches 1 run function tgttos:end/win_data
execute if score ?over tgttos.state matches 1 run return 0
execute if score ?t_it tgttos.timer matches 0 if score #it_holds tgttos.temp matches 1 run function tgttos:end/win_it
