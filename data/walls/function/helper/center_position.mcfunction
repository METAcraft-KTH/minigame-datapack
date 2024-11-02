scoreboard players set #mult WALLS.tmp 10

execute store result score #toCenter WALLS.tmp run data get entity @s Pos[0]
scoreboard players operation #toCenter WALLS.tmp *= #mult WALLS.tmp
scoreboard players add #toCenter WALLS.tmp 5
execute store result entity @s Pos[0] double 0.1 run scoreboard players get #toCenter WALLS.tmp

execute store result score #toInt WALLS.tmp run data get entity @s Pos[1]
execute store result entity @s Pos[1] double 1 run scoreboard players get #toInt WALLS.tmp

execute store result score #toCenter WALLS.tmp run data get entity @s Pos[2]
scoreboard players operation #toCenter WALLS.tmp *= #mult WALLS.tmp
scoreboard players add #toCenter WALLS.tmp 5
execute store result entity @s Pos[2] double 0.1 run scoreboard players get #toCenter WALLS.tmp
