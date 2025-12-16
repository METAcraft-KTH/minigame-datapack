execute unless score game.id GLOBAL matches 1 run return run advancement revoke @s only exact:15
execute unless score ?state exact.game matches 22 run return run advancement revoke @s only exact:15
execute unless score ?round.number exact.game matches 15 run return run advancement revoke @s only exact:15

function exact:states/ingame_run/win
