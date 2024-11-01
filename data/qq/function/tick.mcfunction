# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id qq.config run return -1
execute unless score ?state qq.game matches -2147483648..2147483647 run function qq:load

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!qq.registered] run function qq:register_new_player
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state qq.game = state.init qq.config run function qq:states/lobby/start
execute if score ?state qq.game = state.lobby qq.config run function qq:states/lobby/tick

## !!!EDIT BELOW!!! gamestate-specific tick functions
execute if score ?state qq.game = state.pregame qq.config run function qq:states/pregame/tick
execute if score ?state qq.game = state.ingame qq.config run function qq:states/ingame/tick
execute if score ?state qq.game = state.postgame qq.config run function qq:states/postgame/tick

## Make bossbar visible
bossbar set qq:timer visible true
bossbar set qq:timer players @a

## Utility
function qq:utility/tick

## !!!ADD BELOW!!! Post tick
# add anything else
execute as @a if predicate qq:on_ground run tag @s add onGround
execute as @a unless predicate qq:on_ground run tag @s remove onGround
tag @a[tag=qq.BlockingWithShield] remove qq.BlockingWithShield