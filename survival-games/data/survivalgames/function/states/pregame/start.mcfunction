# This function is called after lobby time ends, and we want to TP everyone to the arena.
scoreboard players operation ?state SURVIVALGAMES.game = state.pregame SURVIVALGAMES.config

# various configs
function survivalgames:states/pregame/configure_gamerule

# initialize timer
execute store result bossbar survivalgames:timer max run scoreboard players get time.pregame SURVIVALGAMES.config
scoreboard players set ?timer SURVIVALGAMES.game 0

# tp everyone to the arena
tp @a 11 0 60003
spawnpoint @a[tag=!admin] ~ ~ ~ ~ ~
kill @e[type=item]

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players operation @a GLOBAL.player_in_state = id SURVIVALGAMES.config
execute as @a[tag=!admin] run function survivalgames:states/pregame/reset_player


scoreboard players reset * SURVIVALGAMES.lobby_sizes
effect give @a[tag=!admin] slowness 10 255 true
effect give @a[tag=!admin] instant_health 10 10 true
effect give @a[tag=!admin] saturation 10 10 true
function survivalgames:states/pregame/prepare_map


execute store result score playercount SURVIVALGAMES.game if entity @a[tag=!admin]
gamemode adventure @a[tag=!admin]
execute as @a[tag=!admin] run function survivalgames:states/pregame/init_player


scoreboard players add round SURVIVALGAMES.game 1
