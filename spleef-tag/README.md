# Spleef-Tag (MAIN Callback Architecture)

This minigame now follows the tournament MAIN datapack callback contract.

## Entry Points

- `spleef:_load`
    - Registered in `data/minecraft/tags/function/load.json`
    - Declares objectives and writes intro/outro config to `main:intro` and `main:outro`
- `spleef:on/introstart`
    - Called once by MAIN when superstate enters intro
- `spleef:on/gamestart`
    - Called once by MAIN when superstate enters gameplay
- `spleef:on/gametick`
    - Called every tick by MAIN while gameplay is active
- `spleef:on/player/death`
    - Called by MAIN for player deaths during gameplay
- `spleef:on/player/latejoin`
    - Called for players who join after game start
- `spleef:on/player/rejoin`
    - Called for reconnecting players

Important: this datapack does not register `tick.json`.

## Internal State Machine

Internal phase values are stored in `?state spleef.game`:

- `1` pregame countdown
- `21` ingame spleef
- `22` ingame tag/color survival
- `23` ingame freeze/scoring

Dispatcher:

- `spleef:_tick` routes to the active `states/*/tick` function

Round flow:

1. `states/pregame/start`
2. `states/ingame_spleef/start`
3. `states/ingame_run/start`
4. `states/ingame_freeze/start`
5. Back to `ingame_spleef/start` until final round
6. Final round ends with `main:api/end_game`

## Gameplay Notes

- Arena anchor marker tag: `spleef.tp.arena`
- TNT pass mechanic uses advancement `spleef:punched`
- Surviving a round increments `spleef.stats.rounds` for MAIN outro leaderboard

## Migration Notes

- Old `GLOBAL` and `game.id` gating are no longer used in active tick flow
- Lifecycle and player-event orchestration is owned by MAIN
- End-of-game transition now uses `main:api/end_game`
