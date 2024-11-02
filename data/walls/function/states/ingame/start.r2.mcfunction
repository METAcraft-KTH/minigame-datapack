# This function is called when the playable minigame actually begins.
scoreboard players operation ?state WALLS.game = state.r2.initial WALLS.config

function walls:states/ingame/reset_map {id: 2}
execute as @e[tag=WALLS.wall,scores={WALLS.ids=2}] run function walls:states/ingame/wall/raise_wall

# initialize timer
execute store result bossbar walls:timer max run scoreboard players get time.r2.initial WALLS.config
scoreboard players set ?timer WALLS.game 0

function walls:states/ingame/on_initial_start

tag @a[tag=!admin] remove WALLS.in_r1
tag @a[tag=!admin] add WALLS.in_r2
