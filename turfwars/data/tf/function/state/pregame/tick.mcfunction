# ============================================================
# tf:state/pregame/tick
# Called by: tf:_tick
# Executor:  Server
#
# 20-second pregame countdown.
# ============================================================

scoreboard players add ?phase_timer tf.timer 1

scoreboard players operation #remaining tf.temp = time.pregame tf.temp
scoreboard players operation #remaining tf.temp -= ?phase_timer tf.timer
scoreboard players operation #display tf.temp = #remaining tf.temp
scoreboard players add #display tf.temp 19
scoreboard players operation #display tf.temp /= #20 main.const
execute if score #display tf.temp matches ..0 run scoreboard players set #display tf.temp 0

title @a actionbar [{"text":"Pregame: ","color":"yellow"},{"score":{"name":"#display","objective":"tf.temp"}},{"text":"s","color":"yellow"}]

execute if score ?phase_timer tf.timer >= time.pregame tf.temp run function tf:state/ingame_run/enter
