advancement revoke @s only atc:kill

execute unless score game.id GLOBAL = id atc.config run return 0

execute if entity @s[team=atc.seekers] run function score:add_points {points:100}

execute if entity @s[tag=atc.initial_seeker] run schedule function atc:z/make_hider_s 1t replace
