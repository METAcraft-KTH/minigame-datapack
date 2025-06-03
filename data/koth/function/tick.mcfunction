# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id koth.config run return -1
execute unless score ?state koth.game matches -2147483648..2147483647 run function koth:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!koth.registered,tag=!admin] run function koth:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state koth.game = state.init koth.config run function koth:states/lobby/start
execute if score ?state koth.game = state.lobby koth.config run function koth:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state koth.game = state.pregame koth.config run function koth:states/pregame/tick
execute if score ?state koth.game = state.ingame koth.config run function koth:states/ingame/tick
execute if score ?state koth.game = state.postgame koth.config run function koth:states/postgame/tick

## Make bossbar visible
bossbar set koth:timer visible true
bossbar set koth:timer players @a

## Utility
function koth:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
