# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id SURVIVALGAMES.config run return -1
execute unless score ?state SURVIVALGAMES.game matches -2147483648..2147483647 run function survivalgames:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!SURVIVALGAMES.registered,tag=!admin] run function survivalgames:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state SURVIVALGAMES.game = state.init SURVIVALGAMES.config run function survivalgames:states/lobby/start
execute if score ?state SURVIVALGAMES.game = state.lobby SURVIVALGAMES.config run function survivalgames:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state SURVIVALGAMES.game = state.pregame SURVIVALGAMES.config run function survivalgames:states/pregame/tick
execute if score ?state SURVIVALGAMES.game = state.ingame SURVIVALGAMES.config run function survivalgames:states/ingame/tick
execute if score ?state SURVIVALGAMES.game = state.postgame SURVIVALGAMES.config run function survivalgames:states/postgame/tick

## Make bossbar visible
bossbar set survivalgames:timer visible true
bossbar set survivalgames:timer players @a

## Utility
function survivalgames:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
