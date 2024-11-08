# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id spl.config run return -1
execute unless score ?state spl.game matches -2147483648..2147483647 run function spl:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!spl.registered,tag=!admin] run function spl:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state spl.game = state.init spl.config run function spl:states/lobby/start
execute if score ?state spl.game = state.lobby spl.config run function spl:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state spl.game = state.pregame spl.config run function spl:states/pregame/tick
execute if score ?state spl.game = state.ingame spl.config run function spl:states/ingame/tick
execute if score ?state spl.game = state.postgame spl.config run function spl:states/postgame/tick

## Make bossbar visible
bossbar set spl:timer visible true
bossbar set spl:timer players @a

## Utility
function spl:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
