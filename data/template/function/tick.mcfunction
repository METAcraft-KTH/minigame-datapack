### Pre tick
execute as @a[tag=!template.registered] run function template:register_player
execute as @a if score @s template.player_left matches 1.. run function template:player_join



### Tick
## Gamestate
execute if score .state template.game = state.lobby template.game run function template:states/lobby
execute if score .state template.game = state.pregame template.game run function template:states/pregame
execute if score .state template.game = state.ingame template.game run function template:states/ingame
execute if score .state template.game = state.postgame template.game run function template:states/postgame

## Utility
function template:utility/tick


### Post tick
