Self-contained datapacks for minigame tournaments. Start from template branch.

## Objectives & Variables

All occurrences of `GAMENAME` (both uppercase and lowercase) is to be replaced by a unique name for the game, in order to prevent namespace conflicts.

- `GLOBAL` all dummy global variables.
    - `game.id` the current active game.
- `GLOBAL.player_left` is used to detect players leaving the game. It is reset individually upon rejoin to make sure the player is at a valid location.
    - there are no variables in this objective.
- `GAMENAME.game` all dummy variables related to the game.
    - `?state` the game's current state.
    - `?timer` variable used to keep track of the timer.
- `GAMENAME.config` all constant values referenced by the game. All of them should be defined in [load.mcfunction](/data/gamename/function/load.mcfunction).
    - `id` the unique ID used to identify the game, compared with `game.id GLOBAL` to see if the game should be running or not.
    - `state.*` control which values of `?state` correspond to which game states. Used by the main tick function.
    - `time.*` control how long the specified phase should last. Used by each phase's tick function.
- Additional `GAMENAME.*` objectives can be created to suit the game's needs, just make sure they're namespaced with the `GAMENAME.` prefix.

## Game loop

The game loop starts with something like this:

1. When the previous game ends, its datapack changes `game.id` to the next game's.
2. The datapack with the corresponding ID (defined in `id GAMENAME.config`) runs, starting with the `gamename:states/lobby/start` function, since the `?state` variable should be pre-configured to `-1`.
3. It then sets `?state` to `0`, activating `gamename:states/lobby/tick`. This function ticks down until the event begins, where it then calls `gamename:states/pregame/start`...

From here you can see the pattern of how a minigame datapack works. Each game state has a folder of the same name, with *at least* the following functions:
- `start.mcfunction`: called by the previous state when it ends.
    - It initializes all variables and updates `?state` so that the `tick` function can run.
- `tick.mcfunction`: runs after `?state` has been updated by the matching `start` function.
    - It counts down the timer, runs game logic etc.
    - Control flow (which state to go to next) can be decided in this function, or it can call another function to make the decision. Whichever is more convenient.

The folder can be expanded with any number of functions, advancements etc as necessary.

Once the postgame ends, make sure to update `game.id` to the next game's.

## Design guidelines

- Don't create game substates.
    - e.g. If a game consists of 3 phases, don't nest them into one state, but make 3 separate game states.
    - Datapacks will be easier to troubleshoot and debug if they all behave similarly.
- Every state is designed to have a hard time limit to prevent a game from taking too long.
    - The game can (and should) end early when needed, such as when only 1 player remains, but there needs to be an upper bound.