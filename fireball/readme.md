# Not Rocket League (`fireball`)

Game 5 of the event. Two teams on two platforms in a lava field; a homing
fireball picks a target and flies at them, and you bat it back with a
blaze rod. Every hit speeds it up. If it touches a player it explodes and
takes a chunk of the floor with it. Last team standing wins.

## Event wiring

This pack is driven by MAIN — it registers **only** `minecraft:load`, and
MAIN calls into `fireball:on/*`:

| Callback | What it does |
|---|---|
| `on/introstart` | Forceloads the arena while the cutscene plays |
| `on/gamestart`  | Gamerules, team friendlyFire, stat reset, then `api/start` |
| `on/gametick`   | `fireball:tick` |
| `on/player/death`    | Eliminates the player, spectator at the arena centre |
| `on/player/latejoin` | Spectator — the floor is already full of holes |
| `on/player/rejoin`   | Restores gamemode + bat (or spectator, if they were out) |

Teams are MAIN's event teams, not this pack's own:
`main.data` → red nether brick platform, `main.it` → blackstone platform.
`main.team` is the source of truth and `fireball:gameplay/make_teams` only
re-joins them, because the previous game's `main:api/end_game` empties both.

The game ends through `fireball:gameplay/finish`, which cleans up and calls
`main:api/end_game` (superstate 3 → 4).

## Arena

Hardcoded to **overworld, centre `50000 64 60000`**, Data at `z+30` and IT at
`z-30`. Run `/function fireball:setup/create_arena` there for the step-by-step
(it is a guide, not an automatic script — it needs WorldEdit).

Moving the arena means updating all four of:

- `main:intro fireball.camera_starting_coords` / `.player_starting_coords` in `fireball:_load`
- the `forceload add` in `fireball:on/introstart`
- the `forceload remove` in `fireball:gameplay/finish`
- the suggested commands in `fireball:setup/create_arena`

Runtime config (dimension, both spawns, ball start speed) lives in storage
`fireball:config` and is set by `fireball:config/*`. It survives reloads, so
it only has to be done once per world.

## Outro stats

- `fireball.st.alive` — ticks survived, shown as `mm:ss.dd`
- `fireball.st.hits` — successful bat hits

No 💎 are awarded by this game.

## Public API

`fireball:api/start`, `api/tick`, `api/game_ended`, `api/end_game_early`,
`api/init`. These predate the MAIN wiring; `on/*` goes through them, and
they are still safe to call by hand for testing.
