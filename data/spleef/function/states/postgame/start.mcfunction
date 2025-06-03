# This function is called when the playable part of the minigame ends.
scoreboard players set ?state spleef.game 3

# initialize timer
execute store result bossbar spleef:timer max run scoreboard players get time.postgame spleef.config
scoreboard players set ?timer spleef.game 0

# tp everyone to the arena
tp @a[tag=!admin] @n[tag=spleef.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function spleef:states/postgame/reset_player