# This function is called when the playable part of the minigame ends.
scoreboard players set ?state tnt.game 3

# new state, reset GLOBAL.player_in_state
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

# initialize timer
execute store result bossbar tnt:timer max run scoreboard players get time.postgame tnt.config
scoreboard players set ?timer tnt.game 0

# tp everyone to the arena
tp @a @n[tag=tnt.tp.arena]