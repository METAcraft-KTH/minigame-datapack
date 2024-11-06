# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players set ?state GAMENAME.game 0

# new state, reset GLOBAL.player_in_state
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

# initialize timer
execute store result bossbar gamename:timer max run scoreboard players get time.lobby GAMENAME.config
scoreboard players set ?timer GAMENAME.game 0

scoreboard players reset @a GLOBAL.player_left

# reset all players
execute as @a[tag=!admin] run function gamename:states/lobby/reset_player