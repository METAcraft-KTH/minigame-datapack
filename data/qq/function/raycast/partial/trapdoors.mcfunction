execute store result score #x qq.raycast run data get entity @s Pos[0] 100.0
execute store result score .y qq.raycast run data get entity @s Pos[1] 100.0
execute store result score #z qq.raycast run data get entity @s Pos[2] 100.0
scoreboard players operation #x qq.raycast %= #100 qq.raycast
scoreboard players operation .y qq.raycast %= #100 qq.raycast
scoreboard players operation #z qq.raycast %= #100 qq.raycast

### Rotation Invarience
scoreboard players operation .x qq.raycast = #x qq.raycast
scoreboard players operation .z qq.raycast = #z qq.raycast
execute if block ~ ~ ~ #minecraft:trapdoors[facing=north,open=true] run function qq:raycast/transforms/rotate_90
execute if block ~ ~ ~ #minecraft:trapdoors[facing=west,open=true] run function qq:raycast/transforms/rotate_180
execute if block ~ ~ ~ #minecraft:trapdoors[facing=south,open=true] run function qq:raycast/transforms/rotate_270

execute if block ~ ~ ~ #minecraft:trapdoors[half=bottom,open=false] if score .y qq.raycast matches ..25 run scoreboard players set .itt qq.raycast 0
execute if block ~ ~ ~ #minecraft:trapdoors[half=top,open=false] if score .y qq.raycast matches 75.. run scoreboard players set .itt qq.raycast 0
execute if block ~ ~ ~ #minecraft:trapdoors[open=true] if score .x qq.raycast matches ..25 run scoreboard players set .itt qq.raycast 0