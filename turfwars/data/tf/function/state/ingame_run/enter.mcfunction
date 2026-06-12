# ============================================================
# tf:state/ingame_run/enter
# Called by: tf:state/pregame/tick, tf:state/ingame_wait/tick
# Executor:  Server
#
# Starts a 30-second tf round and rolls target group size.
# ============================================================

scoreboard players set ?phase tf.state 2
scoreboard players set ?phase_timer tf.timer 0

tellraw @a [{"text":"PVP ROUND ",color:"gold",bold:true},{score:{name:"?round",objective:"tf.state"}}]
tellraw @a ["Each kill advances turf by ",{score:{name:"?round",objective:"tf.state"}}," blocks."]

# change round duration
execute if score ?round tf.state matches 1 run scoreboard players set time.ingame_run tf.temp 900
execute if score ?round tf.state matches 2 run scoreboard players set time.ingame_run tf.temp 1200
execute if score ?round tf.state matches 3.. run scoreboard players set time.ingame_run tf.temp 1500

gamerule pvp true