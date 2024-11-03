# This function is called when the player rejoins the server at the current gamestate.
scoreboard players reset @s GLOBAL.player_left

## !!!ADD BELOW!!! do whatever you need, e.g. checking they're at the lobby/arena and tp them if not
function hh:utility/set_halfheart
team join hh.players @s