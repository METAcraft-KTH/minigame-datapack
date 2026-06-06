# ============================================================
# tf:state/ready/tick
# Called by: tf:on/gametick
# Executor:  Server
#
# 15-second ready phase with actionbar countdown.
# ============================================================

scoreboard players add ?phase_timer tf.timer 1

scoreboard players set #remaining tf.temp 300
scoreboard players operation #remaining tf.temp -= ?phase_timer tf.timer
scoreboard players operation #display tf.temp = #remaining tf.temp
scoreboard players add #display tf.temp 19
scoreboard players operation #display tf.temp /= #20 main.const
execute if score #display tf.temp matches ..0 run scoreboard players set #display tf.temp 0

title @a actionbar [{"text":"Round starts in ","color":"yellow"},{"score":{"name":"#display","objective":"tf.temp"}},{"text":"s","color":"yellow"}]

execute if score ?phase_timer tf.timer matches 300.. run function tf:state/play/enter
