advancement revoke @s only atc:seeker_kill_hider

execute unless score game.id GLOBAL = id atc.config run return 0

function score:add_points {points:60}

execute if entity @s[tag=atc.initial_seeker] run schedule function atc:z/make_hider_s 1t replace
