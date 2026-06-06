# ============================================================
# tf:state/break/tick
# Called by: tf:on/gametick
# Executor:  Server
#
# 30-second break; loops to next round or ends match after round 3.
# ============================================================

scoreboard players add ?phase_timer tf.timer 1

scoreboard players set #remaining tf.temp 600
scoreboard players operation #remaining tf.temp -= ?phase_timer tf.timer
scoreboard players operation #display tf.temp = #remaining tf.temp
scoreboard players add #display tf.temp 19
scoreboard players operation #display tf.temp /= #20 main.const
execute if score #display tf.temp matches ..0 run scoreboard players set #display tf.temp 0

title @a actionbar [{"text":"Break: ","color":"aqua"},{"score":{"name":"#display","objective":"tf.temp"}},{"text":"s","color":"aqua"}]

execute if score ?phase_timer tf.timer matches 600.. if score ?round tf.state matches 3.. run function main:api/end_game
execute if score ?phase_timer tf.timer matches 600.. if score ?round tf.state matches ..2 run function tf:state/play/enter
