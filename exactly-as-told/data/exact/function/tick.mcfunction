# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id exact.config run return -1
execute unless score ?state exact.game matches -2147483648..2147483647 run function exact:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!exact.registered,tag=!admin] run function exact:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state exact.game = state.init exact.config run function exact:states/lobby/start
execute if score ?state exact.game = state.lobby exact.config run function exact:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state exact.game = state.pregame exact.config run function exact:states/pregame/tick
execute if score ?state exact.game = state.ingame_run exact.config run function exact:states/ingame_run/tick
execute if score ?state exact.game = state.ingame_pause exact.config run function exact:states/ingame_pause/tick
execute if score ?state exact.game = state.postgame exact.config run function exact:states/postgame/tick

## Make bossbar visible
bossbar set exact:timer visible true
bossbar set exact:timer players @a

## Utility
function exact:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
