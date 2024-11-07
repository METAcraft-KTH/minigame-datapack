# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state hh.game 1

# various configs
function hh:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar hh:timer max run scoreboard players get time.pregame hh.config
scoreboard players set ?timer hh.game 0

# tp everyone to the arena
tp @a @n[tag=hh.tp.arena]

# add team
team add hh.players "Players"
team modify hh.players friendlyFire false
team join hh.players @a[tag=!admin]

# reset checkpoint for players
scoreboard players set @a hh.checkpoint 0

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function hh:states/pregame/reset_player

fill 50004 101 2007 49998 100 2007 minecraft:air