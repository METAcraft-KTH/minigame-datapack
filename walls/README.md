# Walls Minigame Datapack

Two teams, one bedrock wall, four wardens. Follows the MAIN callback
architecture and registers only a load tag — no `tick.json`.

Namespace: `walls`.

## Timeline

| Match time | What happens |
|---|---|
| 0:00 | Phase 0 (`prep`). Wall is up, wardens are invulnerable. Mine, craft, fortify. |
| 8:00 / 9:00 / 9:30 / 9:50 / 9:55 | Countdown shouts |
| 10:00 | Phase 1 (`drop`). The bedrock wall is removed over 5 ticks, one slice each. Wardens become vulnerable. First iron golem spawns. |
| 10:00+ | Phase 2 (`fight`). Golem respawns every 3 minutes. |
| 20:00 | Sudden death — every warden gets Poison II forever |
| 30:00 | Backstop: the side with healthier wardens wins (see below) |
| — | Game ends the moment either side loses both wardens |

## Map config

**Every hard-coded coordinate lives in three files.** All of them assume the
256×256 arena centred on X=30000 Z=60000 (so 29872/59872 → 30128/60128),
split by a bedrock wall on the X=30000 line, IT west and Data east.
`Y=64` is a placeholder — set it to the real ground level.

| File | Holds |
|---|---|
| `walls:map/setup` | 4 warden posts, 6 shop villagers |
| `walls:player/send_to_spawn`, `walls:player/set_spawnpoints` | the two team spawns |
| `walls:state/drop/tick` | the wall volume that gets deleted |
| `walls:golem/spawn` | where the iron golem lands |
| `walls:on/introstart`, `walls:end/finish` | the forceload region |

The wall fill is `air replace bedrock` over X=30000, Z 59872..60128, Y −59..200,
in five slices of ~13.5k blocks so each stays under the 32768 block command
limit and the whole thing does not land as one lag spike. It starts at Y=−59 so
the world's own bedrock floor is left intact. Only bedrock is touched, so
terrain and player builds that touch the wall survive.

The arena is force-loaded for the whole game (`forceload add`, released in
`walls:end/finish`). Without it, the wall fill and the warden lookups quietly
fail whenever a corner has nobody standing in it — and an empty warden selector
reads as "that team lost".

## Wardens

Two per team, one per corner of their own half, glowing in their team's colour,
300 HP each. Both of a team's wardens share one 600 HP bossbar, `notched_6`.

- They are immobile via a `movement_speed` of 0 rather than a vehicle or
  `NoAI`, which keeps both the melee and the sonic boom working. A warden that
  can never reach its target just shoots it instead.
- They are named, because an unnamed warden digs itself back into the ground
  and despawns after 60 seconds without a target.
- They are `Invulnerable` until the wall drops, so nobody can sabotage their
  own wardens during the build phase.
- Poison can never land a killing blow, so sudden death only leaves them on
  1 HP — it does not end the game by itself. That is what the 30 minute
  backstop in `walls:state/fight/tick` is for; delete those two lines for a
  pure "last wardens standing" game.
- An angry warden blinds everyone within 20 blocks, which makes the endgame
  unplayable, so `walls:player/tick` clears Darkness every tick. Delete that
  line to get it back.

## Economy

Crystals are plain `prismarine_crystals`, no NBT — 8 to start, and nothing is
ever re-issued on respawn (`keep_inventory` is on).

| Event | Payout |
|---|---|
| Kill with a credited killer | killer +5, victim +1 |
| Kill with no credited killer | 5 dropped where the victim died |
| Iron golem, credited | killer +15, each of their teammates +2 |
| Iron golem, no killer | 15 dropped where it fell |

"Credited" means MAIN's `execute on attacker` resolved to a player other than
the victim. A mob kill, a fall, or your own TNT all count as uncredited.

MAIN reports a death one tick late, by which point `immediate_respawn` has
already moved the body to its spawn point. `walls:player/tick` therefore
records every living player's block position each tick, and that is the
position the crystals drop at.

## Shops

Three invulnerable, immobile villagers per spawn. Prices are one recipe per
line in `walls:map/shop/*`, so they are easy to retune.

- **Miner** — logs, cobble, stone, iron, lapis, XP, diamonds
- **Trapper** — TNT, redstone, quartz, slime blocks, string, arrows, dripstone
- **Trickster** — ender pearls, spawners, the Volatile Trident, a Knockback III
  gold sword, the Insta-Respawn Coupon

Three of those need explaining:

- **XP.** A villager cannot sell experience, so the Miner sells a marked
  experience bottle and `walls:econ/redeem_xp` swaps it for 16 XP on the tick
  it lands in an inventory.
- **Spawners.** Bought as a `spawner` item carrying `block_entity_data`, so the
  settings survive placement. `custom_spawn_rules` is what lets them spawn in
  any light level, the helmet is what stops them burning, and the `Team` on the
  spawned mob is what stops it attacking the side that bought it — so the
  zombie and skeleton spawners are team-specific (`walls:map/shop/trickster`
  takes the team as a macro argument).
- **Volatile Trident.** Any trident that sticks into the ground is killed and
  replaced with a `fuse:0` TNT. The shop is the only source of tridents in the
  game, so this needs no per-item check.

## Before this can run

1. **Register the pack with MAIN.** MAIN dispatches by namespace from the
   `main:game` display list in `MAIN/data/main/function/_load.mcfunction`.
   Swap one of the six entries for
   `{id:N,namespace:"walls",gamename:"Walls"}`. Nothing else in this pack
   touches MAIN.
2. **Set the Y coordinates** in the files listed under Map config.
3. Confirm the arena's outer edge is sealed — this pack sets no world border,
   because one left behind by a crashed game would damage everyone standing in
   the lobby at 0/50000.

## Gamerules

`walls:util/gamerules` starts from `main:util/reset_gamerules` and turns the
survival half back on: block/entity/mob drops, random ticks, natural
regeneration, working spawner blocks, `difficulty normal` (on peaceful the
wardens would vanish). Natural mob spawning stays off — every mob in this game
is bought. If placed spawners turn out to be dead on the server, that flag is
the first thing to try.

Friendly fire is turned off on `main.it` and `main.data` at game start so
nobody farms crystals off teammates, and restored in `walls:end/finish`.

## Things the spec did not cover, that you may want

- **No food is issued.** Over 20 minutes players will drop out of the
  regeneration range with only the Trickster's cow spawner to fall back on.
  Consider a bread trade at the Miner, or 16 bread in `walls:player/setup`.
- **Leather armour wears out** in roughly five minutes of fighting. That is
  intended as progression pressure towards the Miner's iron, but if you want
  the team colours to last, add `unbreakable={}` in `walls:player/armor_*`.
- **No spawn protection.** Respawns come back at full health with no
  invulnerability window, so spawn camping works.

## State

Phases live in `?phase walls.state`: 0 prep, 1 dropping, 2 fight, 3 over.

| Fake player | Objective | Meaning |
|---|---|---|
| `?match_timer` | `walls.timer` | ticks since game start |
| `?next_golem` | `walls.timer` | match time the next golem is due |
| `?wall_step` | `walls.state` | which wall slice is next |
| `?golem_state` | `walls.state` | 0 none, 1 alive, 2 just died |
| `?golem_claimed` | `walls.state` | a player has been paid for this golem |
| `?it_wardens` / `?data_wardens` | `walls.state` | wardens still standing |
| `?ready` | `walls.state` | the win check is allowed to fire |
| `?sudden_death` | `walls.state` | poison has been applied |

Per-player: `walls.respawn` (ticks left as a spectator), `walls.x/y/z` (last
living position), `walls.st.kills` and `walls.st.cryst` (outro leaderboards).
