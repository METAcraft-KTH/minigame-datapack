# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players set ?state qq.game 0

# initialize timer
execute store result bossbar qq:timer max run scoreboard players get time.lobby qq.config
scoreboard players set ?timer qq.game 0

# Reset here because it havent been reset while mode disabled
scoreboard players reset @a GLOBAL.player_left