execute unless score game.id GLOBAL matches 1 run return run advancement revoke @s only exact:3
execute unless score ?state exact.game matches 22 run return run advancement revoke @s only exact:3
execute unless score ?round.number exact.game matches 3 run return run advancement revoke @s only exact:3

function exact:states/ingame_run/win

playsound mcmoviememes:diamond_armor master @a ~ ~ ~