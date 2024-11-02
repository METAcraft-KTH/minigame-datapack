data remove storage walls:temp id
execute store result storage walls:temp id int 1 run scoreboard players get @s WALLS.ids
execute unless score @s WALLS.ids matches ..0 unless score @s WALLS.ids matches 0.. run data remove storage walls:temp id
