Self-contained datapacks for minigame tournaments. Start from template branch.

## Game documentation

scoreboard 
- `round.max tnttag.config` no. of last round before game ends and postgame triggers. default `15`
- `round.prot tnttag.config` no. of round to give out safety chestplates. `2`
- `round.arena2 tnttag.config` no. of round to evacuate people from arena 1 to 2. `6`
- `round.arena3 tnttag.config` no. of round to evacuate people from arena 2 to 3. `11`
- `num.bomb tnttag.config` %p of online people to give out TNT to, minimum 1. `20` in arena 1, `25` in arena 2, `35` in arena 3.
- `num.prot tnttag.config` %p of online people to give out chestplate to. *Unused for now* `10`
    - calculated constantly. players who log out with the chestplate do not keep it upon rejoin.
- `num.survive tnttag.config` how many points to gain from not being blown up. `100`, `150`, `200`
- `num.risk tnttag.config` how many ticks to wait between each point gain while holding a TNT. `10`
- `num.gain tnttag.config` how many ticks to wait between each point gain while wearing a chestplate. *Unused for now* `20`
- `?round tnttag.game` start from 0. at start of each tagging phase, compare against configs.

## Template documentation

### Objectives & Variables

- `GLOBAL` all dummy global variables.
    - `game.id` the current active game.
- `GLOBAL.player_in_state` 1 if player is in the right state, undefiened otherwise.
    - do `scoreboard players reset * GLOBAL.player_in_state` and `scoreboard players set @a GLOBAL.player_in_state 1` whenever the state changes.
    - done in all phase start functions by default.
- `GLOBAL.player_left` is used to detect players leaving the game. It is reset individually upon rejoin to make sure the player is at a valid location.
    - no variables in this objective.
- `GLOBAL.time_alive` is used to detect players dying and respawning.
    - no variables in this objective.
    - this score is set to 0 when the player dies (or is in the respawn menu if `doImmediateRespawn` is false), and increments by 1 per tick while the player is alive.
- `tnttag.game` all dummy variables related to the game.
    - `?state` the game's current state.
    - `?timer` variable used to keep track of the gamestate's MAIN timer.
- `tnttag.config` all constant values referenced by the game. All of them should be defined in [load.mcfunction](/data/tnt/function/load.mcfunction).
    - `id` the unique ID used to identify the game, compared with `game.id GLOBAL` to see if the game should be running or not.
    - `state.*` control which values of `?state` correspond to which gamestates. Used by the main tick function.
    - `time.*` control how long the specified phase should last (MAIN timer). Used by each phase's tick function.
- Additional `tnttag.*` objectives can be created to suit the game's needs, just make sure they're namespaced with the `tnttag.` prefix.

#### Other constants

- `20 GLOBAL` is always 20. Useful for converting between ticks and seconds.
- `60 GLOBAL` is always 60. Useful for converting between seconds and minutes.

### Entity tags

These entities should be placed manually in the world.

- `tnttag.tp.arena` marker in the game arena. Everyone gets TPed here on game start (`function tnttag:states/pregame/start`)
- `tnttag.tp.lobby` marker in the main lobby. Everyone gets TPed here on game end (`function tnttag:exit`)

## Game loop

The game loop starts with something like this:

1. When the previous game ends, its datapack changes `game.id` to the next game's.
2. The datapack with the corresponding ID (defined in `id tnttag.config`) runs, starting with the `tnttag:states/lobby/start` function, since the `?state` variable should be pre-configured to `-1`.
3. It then sets `?state` to `0`, activating `tnttag:states/lobby/tick`. This function ticks down until the game begins, where it then calls `tnttag:states/pregame/start`...

From here you can see the pattern of how a minigame datapack works. Each gamestate has a folder of the same name, with *at least* the following functions:
- `start.mcfunction`: called by the previous state when it ends.
    - It initializes all variables and updates `?state` so that the `tick` function can run.
- `tick.mcfunction`: runs after `?state` has been updated by the matching `start` function.
    - It counts down the timer, runs tick game logic etc.
    - Control flow (decide which state to run next) can be in this function, or it can call another function. Whichever is more convenient, but try to make it clear.

The gamestate can be expanded with any number of functions, advancements etc as necessary. **For clarity,** try to make sure everything is placed in folders by the same gamestate name. If a function is used in multiple places, one solution would be to put it in the `utility` folder.

> [!WARNING]  
> Advancements will trigger even if the current gamestate doesn't match. Always check if `?state tnttag.game` matches in the reward function, and stop executing if it doesn't match.
>
> Example: If an advancement triggers by item pickup during ingame, we don't want it to run its function during pregame.

Once the postgame ends, make sure to update `game.id` to the next game's.

## Design guidelines

- Don't create game substates.
    - e.g. If a game consists of 3 phases, don't nest them into one state, but make 3 separate gamestates.
    - Datapacks will be easier to troubleshoot and debug if they all behave similarly.
- Every state is designed to have a hard time limit to prevent a game from taking too long.
    - The game can (and should) end early when needed, such as when only 1 player remains, but there needs to be an upper bound.
- ALL tags must be namespaced (prefixed) with `tnttag.`.
- TEMPORARY variables should start with `#` to denote that they are temporary and should never be read from if they weren't created in the same function.