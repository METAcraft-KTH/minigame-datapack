# This function is called when the playable minigame actually begins.
scoreboard players set ?state hh.game 2

# various configs
function hh:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar hh:timer max run scoreboard players get time.ingame hh.config
scoreboard players set ?timer hh.game 0

# reset scores
scoreboard players reset * hh.skip
scoreboard players reset * hh.totalDeaths
scoreboard players reset * hh.checkpointDeaths

# NEW STATE, reset GLOBAL.player_in_state and reset all players
#scoreboard players reset * GLOBAL.player_in_state
#scoreboard players set @a GLOBAL.player_in_state 1
#execute as @a[tag=!admin] run function hh:states/ingame/reset_player

fill 50004 101 2007 49998 100 2007 minecraft:air

execute as @a[tag=!admin] run function hh:utility/set_halfheart