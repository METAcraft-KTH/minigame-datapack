# This function is called when the player rejoins the server at the current gamestate.
scoreboard players reset @s GLOBAL.player_left
execute unless score @s GLOBAL.player_in_state matches -2147483648..2147483647 run function atc:states/ingame/reset_player

## !!!ADD BELOW!!! do whatever you need, e.g. checking they're at the lobby/arena and tp them if not
function atc:states/ingame/reset_player
team join atc.hiders @s
function atc:states/ingame/init_player
tag @s remove atc.initial_seeker
tag @a remove atc.hider_death
