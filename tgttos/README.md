# WCTBWWGT Minigame Datapack

King of the hill, except nothing connects your spawn to the hill. Follows the
MAIN callback architecture and registers only a load tag — no `tick.json`.

Namespace: `tgttos`. Registered in MAIN as minigame 4, display name `WCTBWWGT`.

## The game

Two teams start on their own platform. Two control points sit 100 blocks away
across open air, each one a floating 9×9 wool floor over a beacon. There is
no bridge. There is infinite concrete.

- Stand within **5 blocks** of a point's marker for **10 seconds** to take it.
- An enemy standing there at the same time freezes the capture for both sides.
- Taking a point off the other team means **rewinding their progress first**, at
  the same speed — 10 seconds from neutral, a full 20 to flip an owned point.
- A point never goes back to neutral once somebody owns it.
- **Holding both points** runs your team's 3:00 timer down. Only one team can be
  holding both, so only one timer ever moves.
- You win on **0:00 while holding both points** — the overtime rule. If the other
  team knocks you off a point, your clock just stops where it is.

Arrows destroy any **concrete** within 0.3 blocks of where they land, and every
bridge in the game is concrete. That is how you cut a crossing you could never
reach on foot, or drop somebody out of the middle of one. An arrow is destroyed
the tick it sticks into something, whether or not it broke anything, so it can
never break its own perch and keep eating the map on the way down. You get one
arrow every 5 seconds and you start with 3.

Nothing else comes down. The point floors and both spawn platforms are wool, and
no tool or arrow in this game touches wool — the islands are fixed terrain and
the whole fight is over what the players themselves put in the air.

## Capture model

One signed score per point, `?prog1` / `?prog2` in `tgttos.state`, running
−200..200 ticks. Positive is Data's progress, negative is IT's. Whoever is alone
inside the radius moves it one tick their way; contested or empty and it holds.

Every rule above falls out of that single bar, which is why there is no separate
"who is capturing" state to keep in sync. Ownership is the one thing the bar
cannot express, so `?own1` / `?own2` latch at 1 (Data) or 2 (IT) when the bar
reaches that end and are never set back to 0.

## Map config

**Every hard-coded coordinate lives in four files.**

| File | Holds |
|---|---|
| `tgttos:map/setup` | both control points, both spawn platforms, the arena centre |
| `tgttos:player/set_spawnpoints`, `tgttos:player/send_to_spawn` | the two team spawns |
| `tgttos:player/check_void` | the Y floor of the match |
| `tgttos:on/introstart`, `tgttos:end/finish` | the forceload region |

|  | Data (pink) | IT (light blue) |
|---|---|---|
| platform | `20025 64 60000` | `19975 64 60000` |
| control point | `20025 64 60100` (point 1) | `19975 64 60100` (point 2) |

The coordinates above are the point **anchors**. `build_point` offsets the marker
half a block on X and Z from there, putting it at the centre of the beacon's own
column, so the 5-block capture radius and the 9×9 floor share a centre with the
beam — 4 blocks of floor on every side of it. Each team's own point is 100
blocks straight south; the other one is a 112-block diagonal. Nobody's point is
closer to them than to the enemy by enough to matter — the diagonal is the
tiebreaker.

### What the pack builds

`tgttos:map/build_point` puts each point back to neutral, bottom to top:

| Y | Block |
|---|---|
| 58 | 3×3 iron blocks — the beacon's pyramid |
| 59 | beacon |
| 60–62 | air, kept clear so the beam reaches the glass |
| 63 | white stained glass in the beam's column, white wool 9×9 around it |
| 64 | the marker |

The beacon is the point of the beacon: the beam is visible from spawn, and it
takes its colour from the stained glass four blocks up. Capturing the point
recolours the glass, so the beam changes team colour across the whole map on the
tick it falls. The floor recolour is `replace #minecraft:wool`, which also means
any concrete somebody bridged across the point is left alone rather than being
converted into their enemy's colour.

The spawn platforms are wool too, for the same reason the point floors are: the
only thing anybody can break is concrete, so nobody can take their own spawn
out from under themselves.

The concrete both teams bridge with is left standing at the end of the match,
the same way Walls leaves what its teams built. `tgttos:map/setup` rebuilds
everything the game actually reads from scratch at the start of the next run.

## Adventure mode

Everyone plays in adventure, which is what makes `can_place_on` and `can_break`
do anything at all.

- **Concrete** carries `minecraft:can_place_on={}`. An empty compound is a block
  predicate with no fields, and a block predicate with no fields matches every
  block — the current way of writing "place this on anything".
- **The pickaxe** (efficiency 4, sharpness 5, unbreakable) carries `can_break`
  for `#tgttos:concrete` and nothing else — the same block tag the arrows work
  off, so there is one definition of "destructible" in the pack. That one list
  is what keeps the beacons, the glass, the iron, the point floors and the
  platforms standing without a single protection check.
- The concrete stack in either hand is put back to 64 every tick by
  `tgttos:player/tick` through the `tgttos:refill_concrete` item modifier.

Regeneration I is handed out once per life with a duration longer than any
match, rather than refreshed on a loop: regeneration heals on the ticks where
its *remaining* duration is a multiple of 50, so re-applying it every tick would
heal every tick instead of every 2.5 seconds. Dying clears it, which is why
`tgttos:on/player/death` hands it back.

## Deaths

Almost every death here is a fall, so `tgttos:player/check_void` kills anyone
who drops below **Y=20** rather than waiting for the world's own void. 64 down
to 20 is under two seconds, comfortably inside the five-second window
`execute on attacker` uses — so whoever shot the bridge out still gets the kill.

Respawn is instant, on your own platform, with the kit intact. The punishment
for dying is the walk back over a bridge that may not be there any more.

`tgttos:util/second` puts back any part of the kit that has gone missing, since
adventure mode still lets people throw a pickaxe off the edge.

## Timeline

| Match time | What happens |
|---|---|
| intro | The pack forceloads the arena and builds both points and both platforms |
| 0:00 | Everyone is on their platform with the kit. Both timers at 3:00, both points neutral |
| — | Game ends the moment either team is at 0:00 while holding both points |
| 15:00 | Backstop: the team with less objective time left wins; dead level is a draw |

The backstop exists because a match where neither side ever holds both points at
once has no natural end. It should never be reached.

## 💎 scoring

The spec did not set these; they are tuned against Walls and are the one set of
numbers here worth arguing about.

| Award | Where |
|---|---|
| +5 per kill | `tgttos:events/kill_reward` |
| +20 per point captured, to everyone standing on it | `tgttos:cap/reward` |
| +150 to the winning team | `tgttos:end/win_data`, `tgttos:end/win_it` |

## Outro leaderboard

Kills, points captured, and blocks of concrete destroyed.

## Debug

- `/function tgttos:debug/status` — markers found, both points' owner and
  progress, both objective timers.
- `/function tgttos:debug/rebuild_map` — puts both points and both platforms
  back to neutral. Safe mid-game, but it repaints the floors white, so the
  colours will be out of step with `?own1` / `?own2` until each point next
  changes hands.
