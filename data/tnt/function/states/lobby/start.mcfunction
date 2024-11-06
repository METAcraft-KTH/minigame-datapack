# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players set ?state tnt.game 0

# new state, reset GLOBAL.player_in_state
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

# initialize timer
execute store result bossbar tnt:timer max run scoreboard players get time.lobby tnt.config
scoreboard players set ?timer tnt.game 0

scoreboard players reset @a GLOBAL.player_left