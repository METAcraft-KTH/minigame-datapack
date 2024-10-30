# if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = id GAMENAME.config run return -1

# Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!GAMENAME.registered] run function gamename:register_new_player
execute as @a if score @s GLOBAL.player_left matches 1.. run function gamename:player_join

# if this game was just selected after the previous game had finished, initialize the next game.
execute if score ?state GAMENAME.game = state.init GAMENAME.config run function gamename:states/lobby/start
execute if score ?state GAMENAME.game = state.lobby GAMENAME.config run function gamename:states/lobby/tick

### Tick
## Gamestate
execute if score ?state GAMENAME.game = state.pregame GAMENAME.config run function gamename:states/pregame/tick
execute if score ?state GAMENAME.game = state.ingame GAMENAME.config run function gamename:states/ingame/tick
execute if score ?state GAMENAME.game = state.postgame GAMENAME.config run function gamename:states/postgame/tick

## Make bossbar visible
bossbar set gamename:timer visible true
bossbar set gamename:timer players @a

## Utility
function gamename:utility/tick

### Post tick
