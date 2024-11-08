# This function is called when the playable part of the minigame ends.
scoreboard players set ?state spl.game 3

# initialize timer
execute store result bossbar spl:timer max run scoreboard players get time.postgame spl.config
scoreboard players set ?timer spl.game 0

# tp everyone to the arena
tp @a @n[tag=spl.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function spl:states/postgame/reset_player