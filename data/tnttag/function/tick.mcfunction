# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id tnttag.config run return -1
execute unless score ?state tnttag.game matches -2147483648..2147483647 run function tnttag:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!tnttag.registered,tag=!admin] run function tnttag:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state tnttag.game = state.init tnttag.config run function tnttag:states/lobby/start
execute if score ?state tnttag.game = state.lobby tnttag.config run function tnttag:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
#execute if score ?state tnttag.game = state.pregame tnttag.config run function tnttag:states/pregame/tick
execute if score ?state tnttag.game = state.ingame_tag tnttag.config run function tnttag:states/ingame_tag/tick
execute if score ?state tnttag.game = state.ingame_grace tnttag.config run function tnttag:states/ingame_grace/tick
execute if score ?state tnttag.game = state.postgame tnttag.config run function tnttag:states/postgame/tick

## Make bossbar visible
bossbar set tnttag:timer visible true
bossbar set tnttag:timer players @a

## Utility
function tnttag:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
