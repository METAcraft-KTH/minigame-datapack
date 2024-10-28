### if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = game.id GAMENAME.game run return -1


### Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!GAMENAME.registered] run function template:register_new_player
execute as @a if score @s GAMENAME.player_left matches 1.. run function template:player_join

### if this game was just selected after the previous game had finished, run the lobby init.
execute if score .state GAMENAME.game = state.lobbyinit GAMENAME.game run function template:states/lobby/init

### Tick
## Gamestate
execute if score .state GAMENAME.game = state.lobby GAMENAME.game run function template:states/lobby/tick
execute if score .state GAMENAME.game = state.pregame GAMENAME.game run function template:states/pregame/tick
execute if score .state GAMENAME.game = state.ingame GAMENAME.game run function template:states/ingame/tick
execute if score .state GAMENAME.game = state.postgame GAMENAME.game run function template:states/postgame/tick

## Make bossbar visible
bossbar set template:timer visible true
bossbar set template:timer players @a

## Utility
function template:utility/tick


### Post tick
