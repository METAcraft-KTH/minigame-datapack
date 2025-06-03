# This function is called when the playable minigame actually begins.
scoreboard players set ?state spleef.game 2

# various configs
function spleef:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar spleef:timer max run scoreboard players get time.ingame spleef.config
scoreboard players set ?timer spleef.game 0

# tp everyone to the arena
tp @a[tag=!admin] @n[tag=spleef.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function spleef:states/ingame/reset_player