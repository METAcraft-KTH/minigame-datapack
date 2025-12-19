# This function is called when the playable part of the minigame ends.
scoreboard players operation ?state SURVIVALGAMES.game = state.postgame SURVIVALGAMES.config

# initialize timer
execute store result bossbar survivalgames:timer max run scoreboard players get time.postgame SURVIVALGAMES.config
scoreboard players set ?timer SURVIVALGAMES.game 0

# tp everyone to the arena
tp @a @n[tag=SURVIVALGAMES.tp.lobby]
execute at @n[tag=SURVIVALGAMES.tp.lobby] run spawnpoint @a[tag=!admin] ~ ~ ~ ~ ~

# NEW STATE, reset GLOBAL.player_in_state and reset all players
scoreboard players reset * GLOBAL.player_in_state
scoreboard players operation @a GLOBAL.player_in_state = id SURVIVALGAMES.config
execute as @a[tag=!admin] run function survivalgames:states/postgame/reset_player

execute as @e[tag=SURVIVALGAMES.middle] at @s run function survivalgames:run_with_range {function: "survivalgames:states/postgame/announce_winners"}

gamemode adventure @a[tag=!admin]


set-block-break-rules remove


