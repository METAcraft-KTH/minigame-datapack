team join atc.hiders @s
tag @s remove atc.initial_seeker
function atc:states/ingame/init_player
title @s title {"text": "You are a Hider now!", "color": "green"}
title @s subtitle {"text": "Quickly, find somewhere to hide!", "color": "yellow"}
tellraw @s {"text": "You are a Hider now!", "color": "green"}
