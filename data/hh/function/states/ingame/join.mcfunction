# This function is called when the player rejoins the server at the current gamestate.
scoreboard players reset @s GLOBAL.player_left

## !!!ADD BELOW!!! do whatever you need, e.g. checking they're at the lobby/arena and tp them if not
attribute @s[tag=!admin] minecraft:max_health base set 1
team join hh.players @s