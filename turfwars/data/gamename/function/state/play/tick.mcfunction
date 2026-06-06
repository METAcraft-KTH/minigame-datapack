# ============================================================
# tf:state/play/tick
# Called by: tf:on/gametick
# Executor:  Server
#
# 2-minute gameplay phase with actionbar countdown.
# ============================================================

scoreboard players add ?phase_timer tf.timer 1

scoreboard players set #remaining tf.temp 2400
scoreboard players operation #remaining tf.temp -= ?phase_timer tf.timer
scoreboard players operation #display tf.temp = #remaining tf.temp
scoreboard players add #display tf.temp 19
scoreboard players operation #display tf.temp /= #20 main.const
execute if score #display tf.temp matches ..0 run scoreboard players set #display tf.temp 0

title @a actionbar [{"text":"Gameplay: ","color":"green"},{"score":{"name":"#display","objective":"tf.temp"}},{"text":"s remaining","color":"green"}]

execute if score ?phase_timer tf.timer matches 2400.. run function tf:state/break/enter
