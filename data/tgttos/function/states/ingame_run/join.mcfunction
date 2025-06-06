# This function is called when the player rejoins the server at the current gamestate.
scoreboard players reset @s GLOBAL.player_left
execute if score @s GLOBAL.player_in_state matches -2147483648..2147483647 run return 0
function tgttos:states/ingame_run/reset_player

## !!!ADD BELOW!!! do whatever you need, e.g. checking they're at the lobby/arena and tp them if not
tp @s @n[tag=tgttos.tp.arena]
gamemode spectator
tellraw @s {"text":"Welcome back! You joined in the middle of a round. Stick around to play in the next round."}