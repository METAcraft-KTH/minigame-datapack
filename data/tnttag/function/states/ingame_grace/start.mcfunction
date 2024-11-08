# This function is called when the tagging phase ends.
scoreboard players set ?state tnttag.game 22

# initialize timer
execute store result bossbar tnttag:timer max run scoreboard players get time.ingame tnttag.config
scoreboard players set ?timer tnttag.game 0

bossbar set tnttag:timer color green

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function tnttag:states/ingame_grace/reset_player
