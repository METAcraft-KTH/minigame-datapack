advancement revoke @s only walls:kill
execute unless score game.id GLOBAL = id WALLS.config run return fail
execute if function walls:states/ingame/is_initial run return fail
pointsystem addpoints @s 50
