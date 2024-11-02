# id The id of the current round.
# This function is called when the playable minigame actually begins.
$scoreboard players operation ?state WALLS.game = state.r$(id).wall_drop WALLS.config

$execute as @e[tag=WALLS.wall,scores={WALLS.ids=$(id)}] run function walls:states/ingame/wall/drop_wall

# initialize timer
$execute store result bossbar walls:timer max run scoreboard players get time.r$(id).wall_drop WALLS.config
scoreboard players set ?timer WALLS.game 0
