# ============================================================
# tf:state/ingame_run/tick
# Called by: tf:_tick
# Executor:  Server
#
# 30-second tf phase with live control-point validation.
# ============================================================

scoreboard players add ?phase_timer tf.timer 1

# countdown math
scoreboard players operation #remaining tf.temp = time.ingame_run tf.temp
scoreboard players operation #remaining tf.temp -= ?phase_timer tf.timer
scoreboard players operation #display tf.temp = #remaining tf.temp
scoreboard players add #display tf.temp 19
scoreboard players operation #display tf.temp /= #20 main.const
execute if score #display tf.temp matches ..0 run scoreboard players set #display tf.temp 0

title @a actionbar ["PVP ends in ",{"score":{"name":"#display","objective":"tf.temp"}},"s"]

# break blocks
execute as @e[type=arrow,nbt={inGround:1b}] at @s run function tf:breakblock

execute unless score ! tf.x matches 30948..31049 run return run function tf:state/win/enter

execute if score ?phase_timer tf.timer >= time.ingame_run tf.temp run function tf:state/ingame_wait/enter