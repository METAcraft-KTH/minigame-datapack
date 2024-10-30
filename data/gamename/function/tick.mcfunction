### if this game is NOT the active game, do not do anything
execute unless score game.id GLOBAL = GAMENAME.id GLOBAL run return -1


### Pre tick: Check for new & rejoining players and update their states
# todo: remove registered tag after the game is over, so it can be run again?
execute as @a[tag=!GAMENAME.registered] run function gamename:register_new_player
execute as @a if score @s GAMENAME.player_left matches 1.. run function gamename:player_join

### if this game was just selected after the previous game had finished, run the lobby init.
execute if score .state GAMENAME.game = state.lobbyinit GAMENAME.game run function gamename:states/lobby/init

### Tick
## Gamestate
execute if score .state GAMENAME.game = state.lobby GAMENAME.game run function gamename:states/lobby/tick
execute if score .state GAMENAME.game = state.pregame GAMENAME.game run function gamename:states/pregame/tick
execute if score .state GAMENAME.game = state.ingame GAMENAME.game run function gamename:states/ingame/tick
execute if score .state GAMENAME.game = state.postgame GAMENAME.game run function gamename:states/postgame/tick

## Make bossbar visible
bossbar set gamename:timer visible true
bossbar set gamename:timer players @a

## Utility
function gamename:utility/tick


### Post tick
