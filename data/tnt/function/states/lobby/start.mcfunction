# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
scoreboard players set ?state tnt.game 0

# initialize timer
execute store result bossbar tnt:timer max run scoreboard players get time.lobby tnt.config
scoreboard players set ?timer tnt.game 0

scoreboard players reset @a GLOBAL.player_left

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tnt:states/lobby/reset_player