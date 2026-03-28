# Mingle Minigame Datapack

This minigame follows the MAIN callback architecture and registers only a load tag.

## Round Flow

1. `pregame` for 20 seconds.
2. `ingame_run` for 30 seconds.
3. `ingame_wait` for 10 seconds.

The game loops `ingame_run -> ingame_wait` until round 15 resolves, then calls `main:api/end_game`.

## Core Mechanic

At the start of each `ingame_run` round, the game rolls a target group size from 4 to 15.
Players must stand near active control points with exact group size.

Control points are marker entities with:

- `type=marker`
- `tag=mingle.cp`
- not tagged `mingle.cp.disabled`

Players in range of any active control point get `mingle.in_cp`.
Players in range of a control point whose local count equals the target group size get `mingle.player.correct`.

At `ingame_wait` start:

- players with `mingle.player.correct` become `mingle.winner`
- players without `mingle.player.correct` become `mingle.loser`
- all control points are tagged `mingle.cp.disabled`

## Required Map Setup

Place control-point markers in the arena before game start:

```mcfunction
summon marker <x> <y> <z> {Tags:["mingle.cp"]}
```

The implementation currently checks players within 4 blocks of each control point.
