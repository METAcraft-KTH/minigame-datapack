# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players set ?state hh.game 0

# initialize timer
execute store result bossbar hh:timer max run scoreboard players get time.lobby hh.config
scoreboard players set ?timer hh.game 0

scoreboard players reset @a GLOBAL.player_left