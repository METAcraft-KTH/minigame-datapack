# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state GAMENAME.game 1

# various configs
function gamename:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar gamename:timer max run scoreboard players get time.pregame GAMENAME.config
scoreboard players set ?timer GAMENAME.game 0

# tp everyone to the arena
tp @a @n[tag=GAMENAME.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function gamename:states/pregame/reset_player

# reset all players' hunger, health, effects, xp
effect clear @a
effect give @a saturation 2 99 true
effect give @a instant_health 2 99 true
xp set @a 0