execute store result score #x qq.raycast run data get entity @s Pos[0] 100.0
execute store result score .y qq.raycast run data get entity @s Pos[1] 100.0
execute store result score #z qq.raycast run data get entity @s Pos[2] 100.0
scoreboard players operation #x qq.raycast %= #100 qq.raycast
scoreboard players operation .y qq.raycast %= #100 qq.raycast
scoreboard players operation #z qq.raycast %= #100 qq.raycast

### Rotation Invarience
scoreboard players operation .x qq.raycast = #x qq.raycast
scoreboard players operation .z qq.raycast = #z qq.raycast
execute if block ~ ~ ~ #minecraft:stairs[facing=north] run function qq:raycast/transforms/rotate_90
execute if block ~ ~ ~ #minecraft:stairs[facing=west] run function qq:raycast/transforms/rotate_180
execute if block ~ ~ ~ #minecraft:stairs[facing=south] run function qq:raycast/transforms/rotate_270

scoreboard players set #bool qq.raycast 0
### Shape = Straight
execute if score .x qq.raycast matches 55.. run scoreboard players set #bool qq.raycast 1

### Shapes
execute if block ~ ~ ~ #minecraft:stairs[shape=inner_left] if score .z qq.raycast matches ..45 run scoreboard players set #bool qq.raycast 1
execute if block ~ ~ ~ #minecraft:stairs[shape=inner_right] if score .z qq.raycast matches 55.. run scoreboard players set #bool qq.raycast 1
execute if block ~ ~ ~ #minecraft:stairs[shape=outer_left] if score .z qq.raycast matches 45.. run scoreboard players set #bool qq.raycast 0
execute if block ~ ~ ~ #minecraft:stairs[shape=outer_right] if score .z qq.raycast matches ..55 run scoreboard players set #bool qq.raycast 0

### Bottom Step
execute store result score #type qq.raycast if block ~ ~ ~ #minecraft:stairs[half=bottom]
execute if score #type qq.raycast matches 1 if score .y qq.raycast matches ..55 run scoreboard players set #bool qq.raycast 1
execute if score #type qq.raycast matches 0 if score .y qq.raycast matches 45.. run scoreboard players set #bool qq.raycast 1

execute if score #bool qq.raycast matches 1 run scoreboard players set .itt qq.raycast 0