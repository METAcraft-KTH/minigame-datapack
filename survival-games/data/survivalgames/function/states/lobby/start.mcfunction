# This function is called when the previous game has officially ended (game.id GLOBAL has switched to this game).
function #survivalgames:init

scoreboard players operation ?state SURVIVALGAMES.game = state.lobby SURVIVALGAMES.config

# initialize timer
execute store result bossbar survivalgames:timer max run scoreboard players get time.lobby SURVIVALGAMES.config
scoreboard players set ?timer SURVIVALGAMES.game 0

scoreboard players reset @a GLOBAL.player_left

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players operation @a GLOBAL.player_in_state = id SURVIVALGAMES.config
execute as @a[tag=!admin] run function survivalgames:states/lobby/reset_player


scoreboard players set round SURVIVALGAMES.game 0
