# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id hh.config run return -1
execute unless score ?state hh.game matches -2147483648..2147483647 run function hh:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!hh.registered,tag=!admin] run function hh:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state hh.game = state.init hh.config run function hh:states/lobby/start
execute if score ?state hh.game = state.lobby hh.config run function hh:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state hh.game = state.pregame hh.config run function hh:states/pregame/tick
execute if score ?state hh.game = state.ingame hh.config run function hh:states/ingame/tick
execute if score ?state hh.game = state.postgame hh.config run function hh:states/postgame/tick

## Make bossbar visible
bossbar set hh:timer visible true
bossbar set hh:timer players @a

## Utility
function hh:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
