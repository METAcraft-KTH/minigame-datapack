execute unless score game.id GLOBAL matches 1 run return run advancement revoke @s only exact:14
execute unless score ?state exact.game matches 22 run return run advancement revoke @s only exact:14
execute unless score ?round.number exact.game matches 14 run return run advancement revoke @s only exact:14

# special case for 14: kill the player to reset fire state & return to lobby
kill @s

function exact:states/ingame_run/win
