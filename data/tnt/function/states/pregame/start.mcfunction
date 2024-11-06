# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state tnt.game 1

# various configs
function tnt:states/pregame/configure_gamerule

# new state, reset GLOBAL.player_in_state
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1

# initialize timer
execute store result bossbar tnt:timer max run scoreboard players get time.pregame tnt.config
scoreboard players set ?timer tnt.game 0

# tp everyone to the arena
tp @a @n[tag=tnt.tp.arena]