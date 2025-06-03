# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id spleef.config run return -1
execute unless score ?state spleef.game matches -2147483648..2147483647 run function spleef:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!spleef.registered,tag=!admin] run function spleef:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state spleef.game = state.init spleef.config run function spleef:states/lobby/start
execute if score ?state spleef.game = state.lobby spleef.config run function spleef:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state spleef.game = state.pregame spleef.config run function spleef:states/pregame/tick
execute if score ?state spleef.game = state.ingame spleef.config run function spleef:states/ingame/tick
execute if score ?state spleef.game = state.postgame spleef.config run function spleef:states/postgame/tick

## Make bossbar visible
bossbar set spleef:timer visible true
bossbar set spleef:timer players @a

## Utility
function spleef:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
