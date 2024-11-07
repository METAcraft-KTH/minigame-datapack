# This function is called when the playable part of the minigame ends.
scoreboard players set ?state hh.game 3

# initialize timer
execute store result bossbar hh:timer max run scoreboard players get time.postgame hh.config
scoreboard players set ?timer hh.game 0

execute as @a[tag=!admin] run function hh:utility/remove_halfheart

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function hh:states/postgame/reset_player