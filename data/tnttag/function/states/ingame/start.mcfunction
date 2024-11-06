# This function is called when the playable minigame actually begins.
scoreboard players set ?state tnttag.game 2

# various configs
function tnttag:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar tnttag:timer max run scoreboard players get time.ingame tnttag.config
scoreboard players set ?timer tnttag.game 0

# tp everyone to the arena
tp @a @n[tag=GAMENAME.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tnttag:states/ingame/reset_player
