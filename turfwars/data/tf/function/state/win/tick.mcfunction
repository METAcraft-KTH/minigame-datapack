scoreboard players add ?phase_timer tf.timer 1

# countdown math
scoreboard players set #remaining tf.temp 200
scoreboard players operation #remaining tf.temp -= ?phase_timer tf.timer
scoreboard players operation #display tf.temp = #remaining tf.temp
scoreboard players add #display tf.temp 19
scoreboard players operation #display tf.temp /= #20 main.const
execute if score #display tf.temp matches ..0 run scoreboard players set #display tf.temp 0

title @a actionbar ["Next match in ",{"score":{"name":"#display","objective":"tf.temp"}},"s"]

execute if score ?phase_timer tf.timer matches 200.. unless score ?played tf.state matches 1 run function tf:state/pregame/enter
execute if score ?phase_timer tf.timer matches 200.. unless score ?played tf.state matches 1 run scoreboard players set ?played tf.state 1

execute if score ?phase_timer tf.timer matches 200.. if score ?played tf.state matches 1 run function main:api/end_game