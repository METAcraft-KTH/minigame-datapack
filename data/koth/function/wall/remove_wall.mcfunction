execute as @e[tag=koth.wall] at @s run fill ~ ~1 ~ ~ 319 ~ air
execute as @e[tag=koth.wall,tag=koth.wall.sand] at @s run setblock ~ ~ ~ sand
execute as @e[tag=koth.wall,tag=!koth.wall.sand] at @s run setblock ~ ~ ~ grass_block
execute as @e[tag=koth.wall] at @s run fill ~ ~-1 ~ ~ ~-3 ~ dirt
execute as @e[tag=koth.wall] at @s run fill ~ -64 ~ ~ ~-4 ~ stone
