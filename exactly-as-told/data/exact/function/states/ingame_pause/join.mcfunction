# This function is called when the player rejoins the server at the current gamestate.
scoreboard players reset @s GLOBAL.player_left
execute if score @s GLOBAL.player_in_state matches -2147483648..2147483647 run return 0
function exact:states/ingame_run/reset_player

## !!!ADD BELOW!!! do whatever you need, e.g. checking they're at the lobby/arena and tp them if not
tp @s @n[tag=exact.tp.arena]
gamemode spectator