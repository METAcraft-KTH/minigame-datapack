execute store result storage atc:temp spread_dist int 1 run scoreboard players get fake_player_radius atc.config
execute store result storage atc:temp max_height int 1 run scoreboard players get fake_player_max_height atc.config
function atc:states/pregame/z/spread_player_0 with storage atc:temp
data remove storage atc:temp spread_dist
data remove storage atc:temp max_height
