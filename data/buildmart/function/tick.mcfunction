# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id buildmart.config run return -1
execute unless score ?state buildmart.game matches -2147483648..2147483647 run function buildmart:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!buildmart.registered,tag=!admin] run function buildmart:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state buildmart.game = state.init buildmart.config run function buildmart:states/lobby/start
execute if score ?state buildmart.game = state.lobby buildmart.config run function buildmart:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state buildmart.game = state.pregame buildmart.config run function buildmart:states/pregame/tick
execute if score ?state buildmart.game = state.ingame buildmart.config run function buildmart:states/ingame/tick
execute if score ?state buildmart.game = state.postgame buildmart.config run function buildmart:states/postgame/tick

## Make bossbar visible
bossbar set buildmart:timer visible true
bossbar set buildmart:timer players @a

## Utility
function buildmart:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
