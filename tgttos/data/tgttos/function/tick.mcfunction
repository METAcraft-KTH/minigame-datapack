# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id tgttos.config run return -1
execute unless score ?state tgttos.game matches -2147483648..2147483647 run function tgttos:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!tgttos.registered,tag=!admin] run function tgttos:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state tgttos.game = state.init tgttos.config run function tgttos:states/lobby/start
execute if score ?state tgttos.game = state.lobby tgttos.config run function tgttos:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state tgttos.game = state.pregame tgttos.config run function tgttos:states/pregame/tick
execute if score ?state tgttos.game = state.ingame_run tgttos.config run function tgttos:states/ingame_run/tick
execute if score ?state tgttos.game = state.ingame_pause tgttos.config run function tgttos:states/ingame_pause/tick
execute if score ?state tgttos.game = state.postgame tgttos.config run function tgttos:states/postgame/tick

## Make bossbar visible
bossbar set tgttos:timer visible true
bossbar set tgttos:timer players @a

## Utility
function tgttos:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
