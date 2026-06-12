# ============================================================
# tf:state/ingame_wait/tick
# Called by: tf:_tick
# Executor:  Server
#
# 10-second wait phase between rounds.
# ============================================================

scoreboard players add ?phase_timer tf.timer 1

scoreboard players operation #remaining tf.temp = time.ingame_wait tf.temp
scoreboard players operation #remaining tf.temp -= ?phase_timer tf.timer
scoreboard players operation #display tf.temp = #remaining tf.temp
scoreboard players add #display tf.temp 19
scoreboard players operation #display tf.temp /= #20 main.const
execute if score #display tf.temp matches ..0 run scoreboard players set #display tf.temp 0

title @a actionbar ["PVP begins in ",{"score":{"name":"#display","objective":"tf.temp"}},"s"]

execute if score ?phase_timer tf.timer >= time.ingame_wait tf.temp if score ?round tf.state matches ..14 run function tf:state/ingame_run/enter