execute positioned ~-5 ~1 ~-5 unless entity @s[dy=1,dx=10,dz=10] run return 0

execute store result score .rand var run random value 1..10

execute if score .rand var matches 1 run item replace entity @s armor.head with end_rod
execute if score .rand var matches 2 run item replace entity @s armor.head with bone
execute if score .rand var matches 3 run item replace entity @s armor.head with lead
execute if score .rand var matches 4 run item replace entity @s armor.head with lightning_rod
execute if score .rand var matches 5 run item replace entity @s armor.head with glass
execute if score .rand var matches 6 run item replace entity @s armor.head with cod
execute if score .rand var matches 7 run item replace entity @s armor.head with cherry_fence_gate
execute if score .rand var matches 8 run item replace entity @s armor.head with crimson_fence_gate
execute if score .rand var matches 9 run item replace entity @s armor.head with feather
execute if score .rand var matches 10 run item replace entity @s armor.head with spyglass