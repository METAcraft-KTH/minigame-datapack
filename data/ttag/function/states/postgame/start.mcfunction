# This function is called when the playable part of the minigame ends.
scoreboard players set ?state ttag.game 3

# initialize timer
execute store result bossbar ttag:timer max run scoreboard players get time.postgame ttag.config
scoreboard players set ?timer ttag.game 0

# tp everyone to the arena
tp @a @n[tag=GAMENAME.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function ttag:states/postgame/reset_player
