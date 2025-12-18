# This function is called when the playable minigame actually begins.
scoreboard players set ?state atc.game 2

# various configs
function atc:states/pregame/configure_gamerule

# initialize timer
bossbar set atc:timer color yellow
execute store result bossbar atc:timer max run scoreboard players get time.ingame atc.config
scoreboard players set ?timer atc.game 0

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

execute as @a[tag=!admin] run function atc:states/ingame/init_player

stopwatch create atc:pointticker
