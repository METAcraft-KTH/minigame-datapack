### This function is called when the previous game has officially ended, and game.id GLOBAL switches to this game.

# countdown of 3 minutes
execute store result bossbar gamename:timer max run scoreboard players get time.lobby GAMENAME.config

scoreboard players reset @a GLOBAL.player_left

