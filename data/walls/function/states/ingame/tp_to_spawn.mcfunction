execute if function walls:states/ingame/is_r1 unless function walls:states/ingame/is_deathmatch run function walls:states/ingame/tp_to_spawn.r1
execute if function walls:states/ingame/is_r1 if function walls:states/ingame/is_deathmatch run function walls:states/ingame/tp_to_spawn.r1.deathmatch
execute if function walls:states/ingame/is_r2 unless function walls:states/ingame/is_deathmatch run function walls:states/ingame/tp_to_spawn.r2
execute if function walls:states/ingame/is_r2 if function walls:states/ingame/is_deathmatch run function walls:states/ingame/tp_to_spawn.r2.deathmatch
execute at @s run spawnpoint @s ~ ~ ~ ~
