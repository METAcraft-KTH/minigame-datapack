# This function is called when the player rejoins the server at the current gamestate.
scoreboard players reset @s GLOBAL.player_left
execute unless score @s GLOBAL.player_in_state matches -2147483648..2147483647 run function koth:states/pregame/reset_player


## !!!ADD BELOW!!! do whatever you need, e.g. checking they're at the lobby/arena and tp them if not

# If not in red or blue team, then run choose one
execute if entity @s[tag=!admin,team=!koth.blue,team=!koth.red] run function koth:choose_team_late
