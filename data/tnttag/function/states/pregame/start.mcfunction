# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state tnttag.game 1

# various configs
function tnttag:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar tnttag:timer max run scoreboard players get time.pregame tnttag.config
scoreboard players set ?timer tnttag.game 0

# tp everyone to the arena
tp @a @n[tag=GAMENAME.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tnttag:states/pregame/reset_player
