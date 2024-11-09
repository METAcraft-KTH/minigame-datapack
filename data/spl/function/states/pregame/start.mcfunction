# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state spl.game 1

# various configs
function spl:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar spl:timer max run scoreboard players get time.pregame spl.config
scoreboard players set ?timer spl.game 0

## build spleef arena
function spl:states/pregame/build_arena

# tp everyone to the arena
execute at @n[tag=spl.tp.arena] run tp @a[tag=!admin] ~ 180 ~

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function spl:states/pregame/reset_player
