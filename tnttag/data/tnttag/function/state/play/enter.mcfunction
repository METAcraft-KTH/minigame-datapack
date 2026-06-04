# ============================================================
# tnttag:state/play/enter
# Called by: tnttag:state/ready/tick, tnttag:state/break/tick
# Executor:  Server
#
# Starts a gameplay round and re-arms sample advancements.
# ============================================================

scoreboard players set ?phase tnttag.state 1
scoreboard players set ?phase_timer tnttag.timer 0
scoreboard players add ?round tnttag.state 1

execute as @a[tag=!admin] run gamemode adventure

advancement revoke @a only tnttag:player_kill
advancement revoke @a only tnttag:consume_item

title @a title {"text":"Fight!","color":"red","bold":true}
title @a subtitle [{"text":"Round ","color":"yellow"},{"score":{"name":"?round","objective":"tnttag.state"}},{"text":" of 3","color":"yellow"}]
