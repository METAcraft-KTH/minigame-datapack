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
| `on/introstart` | Forceloads the arena, and moves MAIN's cutscene into the nether |
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

Hardcoded to the **nether roof, centre `0 128 0`**, Data at `z+30` and IT at
`z-30`. Run `/function fireball:setup/create_arena` there for the step-by-step
(it is a guide, not an automatic script — it needs WorldEdit).

The roof is not decoration. `fireball:setup/place_lava` fills a *single Y layer*
of lava sources, 361×361, and the bedrock ceiling is what holds them up; over
open air the whole sheet would drain. Java's nether is 0..255 tall so y 128 is
buildable — `logical_height: 128` only limits portals and chorus fruit.

Moving the arena means updating all five of:

- `main:intro fireball.camera_starting_coords` / `.player_starting_coords` in `fireball:_load`
- the camera/player teleports and the `forceload add` in `fireball:on/introstart`
- the respawn point in `fireball:on/gamestart`
- the `forceload remove` in `fireball:gameplay/finish`
- the suggested commands in `fireball:setup/create_arena`

### Why the dimension is spelled out everywhere

`@e`, `@n`, `@p` and `@r` only ever see the dimension they are executed in, and
MAIN ticks every minigame from the overworld. So each `fireball:on/*` callback
opens with `execute in minecraft:the_nether` and everything below inherits it.
Three places need care beyond that:

- **The intro cutscene.** `main:superstate/1/macro_summon_camera` teleports with
  a bare `tp @a $(camera_coords)` and `/tp` has no dimension argument, so MAIN
  necessarily summons its camera in the overworld. `fireball:on/introstart` —
  the first hook MAIN gives us, five ticks in — carries the camera and every
  player across. Costs one dimension change a quarter second into the cutscene.

  Everything `main:superstate/2/tick` does to the camera afterwards uses
  `@n[type=block_display,tag=main.camera]`, and `execute as` does not move the
  execution position, so those lookups all happen in MAIN's own dimension and
  stop matching once the camera is on the roof. Two things have to be taken
  over as a result: the `spectate` binding (done once, in `on/introstart`,
  since nothing later un-does it) and the camera drift (`fireball:intro/drift`,
  a self-rescheduling 10-tick loop — **not** a `tick.json`, so MAIN is still
  the only thing ticking this pack).
- **Respawns.** `go_to_state_3` sets the respawn point in the overworld, so
  `fireball:on/gamestart` re-points it at Data's platform in the nether.
  Otherwise every elimination bounces the victim through an overworld loading
  screen and back.
- **The handoff.** `main:api/end_game*` runs `spawnpoint @a[tag=!admin]` and
  respects the dimension it is called from, so `fireball:gameplay/finish`
  returns to the overworld before handing back. Skip that and the lobby respawn
  point ends up inside netherrack.

`fireball:_load` warns any admin if `fireball:config arena_dimension` disagrees
with the hardcoded nether.

Runtime config (dimension, both spawns, ball start speed) lives in storage
`fireball:config` and is set by `fireball:config/*`. It survives reloads, so
it only has to be done once per world.

## Outro stats

- `fireball.st.alive` — ticks survived, shown as `mm:ss.dd`
- `fireball.st.hits` — successful bat hits

## Ending the game

`gameplay/victory_data`, `gameplay/victory_it` and `gameplay/game_over` set
`#winner fireball` to 1, 2 and 0. `gameplay/finish` reads it and hands off to
`main:api/end_game_data`, `main:api/end_game_it` or plain `main:api/end_game`,
which is what awards the best-of-5 series point.

## Public API

`fireball:api/start`, `api/tick`, `api/game_ended`, `api/end_game_early`,
`api/init`. These predate the MAIN wiring; `on/*` goes through them, and
they are still safe to call by hand for testing.
