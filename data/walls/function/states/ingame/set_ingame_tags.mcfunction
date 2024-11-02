tag @s remove WALLS.in_r1
tag @s remove WALLS.in_r1.deathmatch
tag @s remove WALLS.in_r2
tag @s remove WALLS.in_r2.deathmatch

execute if function walls:states/ingame/is_r1 unless function walls:states/ingame/is_deathmatch run tag @s add WALLS.in_r1
execute if function walls:states/ingame/is_r1 if function walls:states/ingame/is_deathmatch run tag @s add WALLS.in_r1.deathmatch
execute if function walls:states/ingame/is_r2 unless function walls:states/ingame/is_deathmatch run tag @s add WALLS.in_r2
execute if function walls:states/ingame/is_r2 if function walls:states/ingame/is_deathmatch run tag @s add WALLS.in_r2.deathmatch
