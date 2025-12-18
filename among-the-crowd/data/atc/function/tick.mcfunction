# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id atc.config run return -1
execute unless score ?state atc.game matches -2147483648..2147483647 run function atc:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!atc.registered,tag=!admin] run function atc:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state atc.game = state.init atc.config run function atc:states/lobby/start
execute if score ?state atc.game = state.lobby atc.config run function atc:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state atc.game = state.pregame atc.config run function atc:states/pregame/tick
execute if score ?state atc.game = state.ingame atc.config run function atc:states/ingame/tick
execute if score ?state atc.game = state.postgame atc.config run function atc:states/postgame/tick

## Make bossbar visible
bossbar set atc:timer visible true
bossbar set atc:timer players @a

## Utility
function atc:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
