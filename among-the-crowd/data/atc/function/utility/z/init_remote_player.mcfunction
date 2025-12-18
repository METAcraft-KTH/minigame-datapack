data merge storage atc:temp {min:0}
scoreboard players reset #max_skins atc.game
scoreboard players reset #max atc.game
execute store result score #max atc.game run data get storage atc:fake_player_data players
execute if score #max atc.game matches 0 run return run data merge entity @s {profile:"MHF_Herobrine", CustomName:"Herobrine"}

scoreboard players remove #max atc.game 1
execute store result storage atc:temp max int 1 run scoreboard players get #max atc.game
execute store result storage atc:temp index int 1 run function atc:utility/random with storage atc:temp
data remove storage atc:temp min
data remove storage atc:temp max

function atc:utility/z/cache_name_and_profile with storage atc:temp
data remove storage atc:temp index
function atc:utility/z/set_name_and_profile with storage atc:temp
data remove storage atc:temp name
data remove storage atc:temp profile
