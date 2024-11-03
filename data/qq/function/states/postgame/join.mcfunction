# This function is called when the player rejoins the server at the current gamestate.
scoreboard players reset @s GLOBAL.player_left

## !!!ADD BELOW!!! do whatever you need, e.g. checking they're at the lobby/arena and tp them if not
team join qq.players @s

# reset score
execute unless score @s qq.Points matches -2147483648..2147483647 run xp set @s 0 levels

execute unless score @s GLOBAL.player_in_state matches 1 run function qq:states/postgame/reset_player