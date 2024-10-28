## This function is called when the previous game has officially ended, and global game.id switches to this game.

# countdown of 3 minutes
bossbar set template:timer max 3600

scoreboard players reset @a GAMENAME.player_left
