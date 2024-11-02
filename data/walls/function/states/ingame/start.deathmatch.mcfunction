# id The id of the current round.
# This function is called when the playable minigame actually begins.
$scoreboard players operation ?state WALLS.game = state.r$(id).deathmatch WALLS.config

execute as @a[tag=!admin] run function walls:states/ingame/tp_to_spawn

# initialize timer
$execute store result bossbar walls:timer max run scoreboard players get time.r$(id).deathmatch WALLS.config
scoreboard players set ?timer WALLS.game 0

execute as @a[tag=!admin] run function walls:states/ingame/set_ingame_tags
