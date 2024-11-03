# This function is called when the playable minigame actually begins.
scoreboard players set ?state GAMENAME.game 2

# various configs
function gamename:states/pregame/configure_gamerule

# new state, reset GLOBAL.player_in_state
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

# initialize timer
execute store result bossbar gamename:timer max run scoreboard players get time.ingame GAMENAME.config
scoreboard players set ?timer GAMENAME.game 0

# tp everyone to the arena
tp @a @n[tag=GAMENAME.tp.arena]