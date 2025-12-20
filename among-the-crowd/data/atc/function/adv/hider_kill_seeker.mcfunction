advancement revoke @s only atc:hider_kill_seeker

execute unless score game.id GLOBAL = id atc.config run return 0

function score:add_points {points:120}
