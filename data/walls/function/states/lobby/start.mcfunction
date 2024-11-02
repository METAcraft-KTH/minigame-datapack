# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players operation ?state WALLS.game = state.lobby WALLS.config

# initialize timer
execute store result bossbar walls:timer max run scoreboard players get time.lobby WALLS.config
scoreboard players set ?timer WALLS.game 0

scoreboard players reset @a GLOBAL.player_left
