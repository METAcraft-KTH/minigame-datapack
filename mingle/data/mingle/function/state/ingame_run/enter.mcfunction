# ============================================================
# mingle:state/ingame_run/enter
# Called by: mingle:state/pregame/tick, mingle:state/ingame_wait/tick
# Executor:  Server
#
# Starts a 30-second mingle round and rolls target group size.
# ============================================================

scoreboard players set ?phase mingle.state 1
scoreboard players set ?phase_timer mingle.timer 0
scoreboard players add ?round mingle.state 1
execute store result score ?target_group mingle.state run random value 4..15

tag @a remove mingle.in_cp
tag @a remove mingle.correct
tag @a remove mingle.winner
tag @a remove mingle.loser

tag @e[type=marker,tag=mingle.cp] remove mingle.cp.disabled

execute as @a[tag=!admin,gamemode=!spectator] run gamemode adventure

title @a title [{"text":"Round ","color":"gold"},{"score":{"name":"?round","objective":"mingle.state"}},{"text":"/15","color":"gold"}]
title @a subtitle [{"text":"Form groups of ","color":"aqua"},{"score":{"name":"?target_group","objective":"mingle.state"}}]
