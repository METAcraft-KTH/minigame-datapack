$execute as @a[team=koth.$(team)] at @s run playsound block.beacon.activate master @s ~ ~ ~ 1 1
$execute as @a[team=koth.$(enemy)] at @s run playsound block.beacon.deactivate master @s ~ ~ ~ 1 1

$execute as @a[team=koth.$(team),distance=..10] run function score:add_points {points:10}

$execute if entity @s[tag=koth.cp.ne] run tellraw @a[team=koth.$(team)] [{"text":"North-East capture point was captured by $(team)!","color":"green"}]
$execute if entity @s[tag=koth.cp.ne] run tellraw @a[team=koth.$(enemy)] [{"text":"North-East capture point was captured by $(team)!","color":"red"}]

$execute if entity @s[tag=koth.cp.center] run tellraw @a[team=koth.$(team)] [{"text":"Center capture point was captured by $(team)!","color":"green"}]
$execute if entity @s[tag=koth.cp.center] run tellraw @a[team=koth.$(enemy)] [{"text":"Center capture point was captured by $(team)!","color":"red"}]

$execute if entity @s[tag=koth.cp.sw] run tellraw @a[team=koth.$(team)] [{"text":"South-West capture point was captured by $(team)!","color":"green"}]
$execute if entity @s[tag=koth.cp.sw] run tellraw @a[team=koth.$(enemy)] [{"text":"South-West capture point was captured by $(team)!","color":"red"}]
