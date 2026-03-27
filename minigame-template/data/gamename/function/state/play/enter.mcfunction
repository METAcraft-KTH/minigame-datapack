# ============================================================
# gamename:state/play/enter
# Called by: gamename:state/ready/tick, gamename:state/break/tick
# Executor:  Server
#
# Starts a gameplay round and re-arms sample advancements.
# ============================================================

scoreboard players set ?phase gamename.state 1
scoreboard players set ?phase_timer gamename.timer 0
scoreboard players add ?round gamename.state 1

execute as @a[tag=!admin] run gamemode adventure

advancement revoke @a only gamename:player_kill
advancement revoke @a only gamename:consume_item

title @a title {"text":"Fight!","color":"red","bold":true}
title @a subtitle [{"text":"Round ","color":"yellow"},{"score":{"name":"?round","objective":"gamename.state"}},{"text":" of 3","color":"yellow"}]
