# This function is called when the playable part of the minigame ends.
scoreboard players set ?state buildmart.game 3

# initialize timer
execute store result bossbar buildmart:timer max run scoreboard players get time.postgame buildmart.config
scoreboard players set ?timer buildmart.game 0

# tp everyone to the arena
tp @a[tag=!admin] @n[tag=buildmart.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function buildmart:states/postgame/reset_player

function #buildmart:map_reset
