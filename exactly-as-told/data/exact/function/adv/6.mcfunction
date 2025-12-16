execute unless score game.id GLOBAL matches 1 run return run advancement revoke @s only exact:6
execute unless score ?state exact.game matches 22 run return run advancement revoke @s only exact:6
execute unless score ?round.number exact.game matches 6 run return run advancement revoke @s only exact:6

function exact:states/ingame_run/win
