# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id tnt.config run return -1
execute unless score ?state tnt.game matches -2147483648..2147483647 run function tnt:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!tnt.registered,tag=!admin] run function tnt:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state tnt.game = state.init tnt.config run function tnt:states/lobby/start
execute if score ?state tnt.game = state.lobby tnt.config run function tnt:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state tnt.game = state.pregame tnt.config run function tnt:states/pregame/tick
execute if score ?state tnt.game = state.ingame tnt.config run function tnt:states/ingame/tick
execute if score ?state tnt.game = state.postgame tnt.config run function tnt:states/postgame/tick

## Make bossbar visible
bossbar set tnt:timer visible true
bossbar set tnt:timer players @a

## Utility
function tnt:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
