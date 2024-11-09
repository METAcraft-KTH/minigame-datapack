advancement revoke @s only survivalgames:kill
execute unless score game.id GLOBAL = id SURVIVALGAMES.config run return fail
pointsystem addpoints @s 40
