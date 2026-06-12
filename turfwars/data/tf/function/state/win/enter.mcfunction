scoreboard players set ?phase tf.state 3
scoreboard players set ?phase_timer tf.timer 0

clear @a[tag=!admin]

execute if score ! tf.x matches 31001.. run tellraw @a {text:"Blue team won!",color:"blue",bold:true}
execute if score ! tf.x matches 31001.. as @a[team=tf.blue] run function main:api/give_points {points:100,reason:"Match won"}
execute if score ! tf.x matches ..31000 run tellraw @a {text:"Red team won!",color:"red",bold:true}
execute if score ! tf.x matches ..31000 as @a[team=tf.red] run function main:api/give_points {points:100,reason:"Match won"}