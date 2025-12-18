clear @s
effect give @s minecraft:saturation 1 255 true
effect clear @s
execute if entity @s[team=atc.hiders] run function atc:states/ingame/z/init_hider
execute if entity @s[team=atc.seekers] run function atc:states/ingame/z/init_seeker
execute at @n[tag=atc.tp.seekerspawn] rotated as @n[tag=atc.tp.seekerspawn] run spawnpoint @s ~ ~ ~ ~ ~
