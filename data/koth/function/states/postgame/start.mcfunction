# This function is called when the playable part of the minigame ends.
scoreboard players set ?state koth.game 3

# initialize timer
execute store result bossbar koth:timer max run scoreboard players get time.postgame koth.config
scoreboard players set ?timer koth.game 0

# tp everyone to the arena
tp @a[tag=!admin] @n[tag=koth.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function koth:states/postgame/reset_player