# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players set ?state spl.game 0

# initialize timer
execute store result bossbar spl:timer max run scoreboard players get time.lobby spl.config
scoreboard players set ?timer spl.game 0

scoreboard players reset @a GLOBAL.player_left

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function spl:states/lobby/reset_player