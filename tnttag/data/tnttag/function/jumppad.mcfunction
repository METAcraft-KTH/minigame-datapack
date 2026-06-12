# arena 3's evacuation
function tnttag:state/ingame_tag/escaped

particle explosion_emitter ~ ~ ~ 0 0 0 0 5 normal

scoreboard players set $x player_motion.api.launch 0
scoreboard players set $y player_motion.api.launch 60000
scoreboard players set $z player_motion.api.launch -160000
function player_motion:api/launch_xyz