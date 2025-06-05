# This function is called when the playable minigame actually begins.
scoreboard players set ?state buildmart.game 2

execute store result score ?game-id buildmart.game run random value -2147483648..2147483647

# various configs
function buildmart:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar buildmart:timer max run scoreboard players get time.ingame buildmart.config
scoreboard players set ?timer buildmart.game 0

function buildmart:states/ingame/init_items

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function buildmart:states/ingame/reset_player

