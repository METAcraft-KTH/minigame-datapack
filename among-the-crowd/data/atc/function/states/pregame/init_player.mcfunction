execute if entity @s[team=atc.hiders] run function atc:states/pregame/z/init_hider
execute if entity @s[team=atc.seekers] run function atc:states/pregame/z/init_seeker
execute at @n[tag=atc.tp.seekerspawn] rotated as @n[tag=atc.tp.seekerspawn] run spawnpoint @s ~ ~ ~ ~ ~
