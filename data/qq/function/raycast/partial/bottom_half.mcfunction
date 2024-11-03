# get y coord's decimal points (ex: Y=69.45 -> .y = 45) 
execute store result score .y qq.raycast run data get entity @s Pos[1] 100.0
scoreboard players operation .y qq.raycast %= #100 qq.raycast


# stop raycast if inside bottom half
execute if score .y qq.raycast matches ..55 run scoreboard players set .itt qq.raycast 0
