## INGAME PHASE: The game has begun, and people are playing

# manage rejoin etc
execute as @a[scores={GLOBAL.player_left=1..},tag=!admin] run function walls:states/ingame/join
execute as @a[scores={GLOBAL.time_alive=0},tag=!admin] run function walls:states/ingame/while_dead
execute as @a[scores={GLOBAL.time_alive=1},tag=!admin] run function walls:states/ingame/respawn

# increment timer
scoreboard players add ?timer WALLS.game 1
# calculate remaining time

execute if score ?state WALLS.game = state.r1.initial WALLS.config run scoreboard players operation #remainingseconds WALLS.game = time.r1.initial WALLS.config
execute if score ?state WALLS.game = state.r1.wall_drop WALLS.config run scoreboard players operation #remainingseconds WALLS.game = time.r1.wall_drop WALLS.config
execute if score ?state WALLS.game = state.r1.deathmatch WALLS.config run scoreboard players operation #remainingseconds WALLS.game = time.r1.deathmatch WALLS.config
execute if score ?state WALLS.game = state.r2.initial WALLS.config run scoreboard players operation #remainingseconds WALLS.game = time.r2.initial WALLS.config
execute if score ?state WALLS.game = state.r2.wall_drop WALLS.config run scoreboard players operation #remainingseconds WALLS.game = time.r2.wall_drop WALLS.config
execute if score ?state WALLS.game = state.r2.deathmatch WALLS.config run scoreboard players operation #remainingseconds WALLS.game = time.r2.deathmatch WALLS.config
scoreboard players operation #remainingseconds WALLS.game -= ?timer WALLS.game
scoreboard players operation #remainingseconds WALLS.game /= 20 GLOBAL
scoreboard players operation #displayminutes WALLS.game = #remainingseconds WALLS.game
scoreboard players operation #displayminutes WALLS.game /= 60 GLOBAL
scoreboard players operation #displayseconds WALLS.game = #remainingseconds WALLS.game
scoreboard players operation #displayseconds WALLS.game %= 60 GLOBAL
# display remaining time

execute if score ?state WALLS.game = state.r1.initial WALLS.config run function walls:states/ingame/update_timer_text {message: "\"Walls drop in \"", args: "\"color\": \"green\","}
execute if score ?state WALLS.game = state.r1.wall_drop WALLS.config run function walls:states/ingame/update_timer_text {message: "\"Deathmatch in \"", args: "\"color\": \"gold\","}
execute if score ?state WALLS.game = state.r1.deathmatch WALLS.config run function walls:states/ingame/update_timer_text {message: "\"Ending after \"", args: "\"color\": \"red\","}
execute if score ?state WALLS.game = state.r2.initial WALLS.config run function walls:states/ingame/update_timer_text {message: "\"Walls drop in \"", args: "\"color\": \"green\","}
execute if score ?state WALLS.game = state.r2.wall_drop WALLS.config run function walls:states/ingame/update_timer_text {message: "\"Deathmatch in \"", args: "\"color\": \"gold\","}
execute if score ?state WALLS.game = state.r2.deathmatch WALLS.config run function walls:states/ingame/update_timer_text {message: "\"Ending after \"", args: "\"color\": \"red\","}
execute store result bossbar walls:timer value run scoreboard players get ?timer WALLS.game


execute if score ?state WALLS.game = state.r1.initial WALLS.config run bossbar set walls:timer color green
execute if score ?state WALLS.game = state.r1.wall_drop WALLS.config run bossbar set walls:timer color yellow
execute if score ?state WALLS.game = state.r1.deathmatch WALLS.config run bossbar set walls:timer color red
execute if score ?state WALLS.game = state.r2.initial WALLS.config run bossbar set walls:timer color green
execute if score ?state WALLS.game = state.r2.wall_drop WALLS.config run bossbar set walls:timer color yellow
execute if score ?state WALLS.game = state.r2.deathmatch WALLS.config run bossbar set walls:timer color red

execute as @e[tag=WALLS.lava_point] at @s run function walls:states/ingame/lava/update_lava_points

function walls:states/ingame/check_victory



## end game

execute if score ?state WALLS.game = state.r1.initial WALLS.config if score ?timer WALLS.game >= time.r1.initial WALLS.config run function walls:states/ingame/start.r1.drop_wall
execute if score ?state WALLS.game = state.r1.wall_drop WALLS.config if score ?timer WALLS.game >= time.r1.wall_drop WALLS.config run function walls:states/ingame/start.r1.deathmatch
execute if score ?state WALLS.game = state.r1.deathmatch WALLS.config if score ?timer WALLS.game >= time..r1.deathmatch WALLS.config run function walls:states/midgame/start
execute if score ?state WALLS.game = state.r2.initial WALLS.config if score ?timer WALLS.game >= time.r2.initial WALLS.config run function walls:states/ingame/start.r2.drop_wall
execute if score ?state WALLS.game = state.r2.wall_drop WALLS.config if score ?timer WALLS.game >= time.r2.wall_drop WALLS.config run function walls:states/ingame/start.r2.deathmatch
execute if score ?state WALLS.game = state.r2.deathmatch WALLS.config if score ?timer WALLS.game >= time.r2.deathmatch WALLS.config run function walls:states/postgame/start

