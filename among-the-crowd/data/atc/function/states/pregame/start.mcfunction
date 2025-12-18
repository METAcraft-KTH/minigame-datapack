# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players set ?state atc.game 1

# various configs
function atc:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar atc:timer max run scoreboard players get time.pregame atc.config
bossbar set atc:timer color red
scoreboard players set ?timer atc.game 0

function atc:states/pregame/choose_first_seeker
team join atc.hiders @a[tag=!admin,team=!atc.seekers]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players set @a GLOBAL.player_in_state 1
execute as @a[tag=!admin] run function atc:states/pregame/reset_player

# reset all players' hunger, health, effects, xp, inventory
effect clear @a[tag=!admin]
effect give @a[tag=!admin] saturation 2 99 true
effect give @a[tag=!admin] instant_health 2 99 true
xp set @a[tag=!admin] 0 levels
xp set @a[tag=!admin] 0 points
clear @a[tag=!admin]

function atc:states/pregame/spawn_fake_players

execute as @a[tag=!admin] run function atc:states/pregame/init_player
