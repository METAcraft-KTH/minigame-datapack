execute if function walls:states/ingame/is_initial run return fail
execute if entity @s[gamemode=spectator] run return fail
execute unless score idle_point_timer WALLS.game matches 1 run return fail
execute if entity @s[team=!WALLS.red] if entity @a[team=WALLS.red,gamemode=survival,distance=..25] run return 1
execute if entity @s[team=!WALLS.blue] if entity @a[team=WALLS.blue,gamemode=survival,distance=..25] run return 1
execute if entity @s[team=!WALLS.green] if entity @a[team=WALLS.green,gamemode=survival,distance=..25] run return 1
execute if entity @s[team=!WALLS.yellow] if entity @a[team=WALLS.yellow,gamemode=survival,distance=..25] run return 1
return fail
