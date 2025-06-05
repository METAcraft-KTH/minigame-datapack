# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state buildmart.game 1

# various configs
function buildmart:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar buildmart:timer max run scoreboard players get time.pregame buildmart.config
scoreboard players set ?timer buildmart.game 0

# tp everyone to the arena
tp @a[tag=!admin] @n[tag=buildmart.tp.arena]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function buildmart:states/pregame/reset_player

# reset all players' hunger, health, effects, xp, inventory
effect clear @a[tag=!admin]
effect give @a[tag=!admin] saturation 2 99 true
effect give @a[tag=!admin] instant_health 2 99 true
xp set @a[tag=!admin] 0 levels
xp set @a[tag=!admin] 0 points
clear @a[tag=!admin]
