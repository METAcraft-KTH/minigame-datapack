scoreboard players set @s koth.cp.delta 0
# When the red team has the point, and there is a blue that is challenging.
execute if score @s koth.cp matches ..0 if entity @a[team=koth.blue,distance=..5] run scoreboard players add @s koth.cp.delta 1
# When the point is neutral, and there is a blue that is overtaking and no red that is protecting.
execute if score @s koth.cp matches 0..99 if entity @a[team=koth.blue,distance=..5] unless entity @a[team=koth.red,distance=..5] run scoreboard players add @s koth.cp.delta 1
# When the blue team has the point, and there is a red that is challenging.
execute if score @s koth.cp matches 0.. if entity @a[team=koth.red,distance=..5] run scoreboard players remove @s koth.cp.delta 1
# When the point is neutral, and there is a red that is overtaking and no blue that is protecting.
execute if score @s koth.cp matches -99..0 if entity @a[team=koth.red,distance=..5] unless entity @a[team=koth.blue,distance=..5] run scoreboard players remove @s koth.cp.delta 1
scoreboard players operation @s koth.cp += @s koth.cp.delta

# When the red team has the point, but blue is overtaking.
execute if score @s koth.cp.delta matches 1.. if score @s koth.cp matches ..0 run function koth:cp/line {color: "light_gray"}
# When the blue team has the point, but red is overtaking.
execute if score @s koth.cp.delta matches ..-1 if score @s koth.cp matches 0.. run function koth:cp/line {color: "light_gray"}
# When the point is being overtaken by blue
execute if score @s koth.cp.delta matches 1.. if score @s koth.cp matches 0.. run function koth:cp/line {color: "blue"}
# When the point is being overtaken by red
execute if score @s koth.cp.delta matches ..-1 if score @s koth.cp matches ..0 run function koth:cp/line {color: "red"}

# 3.6 degrees per tick = 5 seconds per revolution
execute unless score @s koth.cp.delta matches 0 run tp @s ~ ~ ~ ~3.6 ~