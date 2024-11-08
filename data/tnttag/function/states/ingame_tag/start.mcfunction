# This function is called when the tagging phase starts.
scoreboard players set ?state tnttag.game 21

# initialize timer
execute store result bossbar tnttag:timer max run scoreboard players get time.ingame tnttag.config
scoreboard players set ?timer tnttag.game 0

bossbar set tnttag:timer color red

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tnttag:states/ingame_tag/reset_player

# increment round counter
scoreboard players add ?round tnttag.game 1

## TODO: set max time, arena transfer event