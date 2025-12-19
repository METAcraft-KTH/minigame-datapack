execute store result score #x qq.raycast run data get entity @s Pos[0] 100.0
execute store result score #z qq.raycast run data get entity @s Pos[2] 100.0
scoreboard players operation #x qq.raycast %= #100 qq.raycast
scoreboard players operation #z qq.raycast %= #100 qq.raycast

### Rotation Invarience
scoreboard players operation .x qq.raycast = #x qq.raycast
scoreboard players operation .z qq.raycast = #z qq.raycast
execute if block ~ ~ ~ #minecraft:doors[facing=north] run function qq:raycast/transforms/rotate_90
execute if block ~ ~ ~ #minecraft:doors[facing=west] run function qq:raycast/transforms/rotate_180
execute if block ~ ~ ~ #minecraft:doors[facing=south] run function qq:raycast/transforms/rotate_270

execute if block ~ ~ ~ #minecraft:doors[hinge=left,open=true] if score .z qq.raycast matches ..25 run scoreboard players set .itt qq.raycast 0
execute if block ~ ~ ~ #minecraft:doors[hinge=right,open=true] if score .z qq.raycast matches 75.. run scoreboard players set .itt qq.raycast 0
execute if block ~ ~ ~ #minecraft:doors[open=false] if score .x qq.raycast matches ..25 run scoreboard players set .itt qq.raycast 0