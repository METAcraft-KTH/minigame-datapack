execute unless score game.id GLOBAL = id WALLS.config as @a[scores={GLOBAL.player_left=1..},tag=!admin] if score @s GLOBAL.player_in_state = id WALLS.config run function walls:cleanup

# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id WALLS.config run return -1
execute unless score ?state WALLS.game matches -2147483648..2147483647 run function walls:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!WALLS.registered,tag=!admin] run function walls:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead,tag=!admin] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead,tag=!admin] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state WALLS.game = state.init WALLS.config run function walls:states/lobby/start
execute if score ?state WALLS.game = state.lobby WALLS.config run function walls:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state WALLS.game = state.pregame WALLS.config run function walls:states/pregame/tick
execute if score ?state WALLS.game = state.r1.initial WALLS.config run function walls:states/ingame/tick
execute if score ?state WALLS.game = state.r1.wall_drop WALLS.config run function walls:states/ingame/tick
execute if score ?state WALLS.game = state.r1.deathmatch WALLS.config run function walls:states/ingame/tick
execute if score ?state WALLS.game = state.midgame WALLS.config run function walls:states/midgame/tick
execute if score ?state WALLS.game = state.r2.initial WALLS.config run function walls:states/ingame/tick
execute if score ?state WALLS.game = state.r2.wall_drop WALLS.config run function walls:states/ingame/tick
execute if score ?state WALLS.game = state.r2.deathmatch WALLS.config run function walls:states/ingame/tick
execute if score ?state WALLS.game = state.postgame WALLS.config run function walls:states/postgame/tick

## Make bossbar visible
bossbar set walls:timer visible true
bossbar set walls:timer players @a

## Utility
function walls:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else

scoreboard players operation @a[tag=!admin] GLOBAL.player_in_state = id WALLS.config
