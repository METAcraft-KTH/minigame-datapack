# ============================================================
# tf:state/play/enter
# Called by: tf:state/ready/tick, tf:state/break/tick
# Executor:  Server
#
# Starts a gameplay round and re-arms sample advancements.
# ============================================================

scoreboard players set ?phase tf.state 1
scoreboard players set ?phase_timer tf.timer 0
scoreboard players add ?round tf.state 1

execute as @a[tag=!admin] run gamemode adventure

advancement revoke @a only tf:player_kill
advancement revoke @a only tf:consume_item

title @a title {"text":"Fight!","color":"red","bold":true}
title @a subtitle [{"text":"Round ","color":"yellow"},{"score":{"name":"?round","objective":"tf.state"}},{"text":" of 3","color":"yellow"}]
