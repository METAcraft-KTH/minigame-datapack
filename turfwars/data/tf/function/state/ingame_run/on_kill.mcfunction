advancement revoke @s only tf:on_kill
execute unless score ?phase tf.state matches 2 run return 0

execute if entity @s[team=tf.red] as @a[team=tf.red,distance=.1..] run function score:add_points {points:3}
execute if entity @s[team=tf.blue] as @a[team=tf.blue,distance=.1..] run function score:add_points {points:3}
function main:api/give_points {points:15,reason:"Kill"}

execute if entity @s[team=tf.red] run scoreboard players operation ?turf tf.state += ?round tf.state
execute if entity @s[team=tf.blue] run scoreboard players operation ?turf tf.state -= ?round tf.state