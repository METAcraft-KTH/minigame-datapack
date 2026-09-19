# splat — Paint the Campus

Minigame #1. **The actual game is implemented by a server-side mod**, not by this
datapack. This pack is only the glue between MAIN and the mod.

## What this pack does

| File | Purpose |
|---|---|
| `_load` | declares `splat.state` + the two stat objectives, writes intro slides and the outro leaderboard config |
| `on/introstart` | clears the running flag, resets last run's stats |
| `on/gamestart` | sets the running flag to `1`, splits the two teams to their spawns |
| `on/gametick` | keeps the running flag at `1` |
| `player/set_spawnpoints` | per-team respawn points |
| `on/player/*` | no-ops except late joiners, who are put into spectator |

## Contract with the mod

**Running flag** — fake player `?running` in objective `splat.state`:

- `0` — the minigame is not active
- `1` — the minigame is active (MAIN's `?superstate main.state` is `3`)

The mod should poll this and start/stop its own logic accordingly.

**Stats** — both dummy objectives, written by the mod, read by MAIN during the
outro to show the top 5 players:

- `splat.stats.blocks` — blocks painted, shown as "Most blocks painted:"
- `splat.stats.kills` — kills, shown as "Most enemies splatted:"

**Ending the game** — the mod calls `main:api/end_game` itself when the game is
over. This datapack never ends the game on its own.

## Map config

Marked `### MAP CONFIG ###` in the files.

| | Coordinates | Facing |
|---|---|---|
| Intro camera | `0 100 50000` | due south (MAIN hardcodes this) |
| Data spawn (`main.team` 1) | `-48 63 50070` | south, `0 0` |
| IT spawn (`main.team` 2) | `2 69 49725` | east, `-90 0` |

`main:intro splat.player_starting_coords` is the Data spawn, because MAIN only
teleports everyone to a single coordinate. `on/gamestart` runs on the same tick
and moves the IT players on to their own spawn, so nobody sees the difference.

## TODO

- Intro slides in `_load` are placeholders. The scoring slide says
  "+1💎 for each block you paint" and does not mention kills yet.
