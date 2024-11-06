# This function is called when the player rejoins the server at the current gamestate.
scoreboard players reset @s GLOBAL.player_left

## !!!ADD BELOW!!! do whatever you need, e.g. checking they're at the lobby/arena and tp them if not


execute if entity @s[tag=!admin,tag=!WALLS.in_r1] if function walls:states/ingame/is_r1 unless function walls:states/ingame/is_deathmatch run function walls:states/ingame/join.new_player
execute if entity @s[tag=!admin,tag=!WALLS.in_r2] if function walls:states/ingame/is_r2 unless function walls:states/ingame/is_deathmatch run function walls:states/ingame/join.new_player

execute unless entity @s[tag=!admin,tag=WALLS.in_r1] if function walls:states/ingame/is_deathmatch run function walls:states/ingame/join.missed_deathmatch_tp
execute unless entity @s[tag=!admin,tag=WALLS.in_r2] if function walls:states/ingame/is_deathmatch run function walls:states/ingame/join.missed_deathmatch_tp

execute unless entity @s[tag=!admin,tag=!WALLS.in_r1.deathmatch] if function walls:states/ingame/is_r1 if function walls:states/ingame/is_deathmatch run function walls:states/ingame/join.new_player
execute unless entity @s[tag=!admin,tag=!WALLS.in_r2.deathmatch] if function walls:states/ingame/is_r2 if function walls:states/ingame/is_deathmatch run function walls:states/ingame/join.new_player
