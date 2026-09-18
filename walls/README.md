# Walls Minigame Datapack

Two teams, one bedrock wall, four giant ravagers. Follows the MAIN callback
architecture and registers only a load tag — no `tick.json`.

Namespace: `walls`.

## Timeline

| Match time | What happens |
|---|---|
| intro | The pack raises the bedrock wall and places the towers and shops |
| 0:00 | Phase 0 (`prep`). Wall is up, towers are invulnerable. Mine, craft, fortify. |
| 8:00 / 9:00 / 9:30 / 9:50 / 9:55 | Countdown shouts |
| 10:00 | Phase 1 (`drop`). The bedrock wall is removed over 8 ticks, one slice each. Towers become vulnerable. First evoker spawns. |
| 10:00+ | Phase 2 (`fight`). A new evoker every 3 minutes. |
| 20:00 | Sudden death — every tower gets Poison II forever |
| 30:00 | Backstop: the side with healthier towers wins (see below) |
| — | Game ends the moment either side loses both towers |

## Map config

**Every hard-coded coordinate lives in three files.** All of them assume the
256×256 arena centred on X=30000 Z=60000 (so 29872/59872 → 30128/60128),
split by a bedrock wall on the X=30000 line, IT west and Data east.
`Y=64` is a placeholder — set it to the real ground level.

| File | Holds |
|---|---|
| `walls:map/setup`, `walls:tower/watchdog` | the 4 tower posts, 6 shop villagers |
| `walls:player/send_to_spawn`, `walls:player/set_spawnpoints` | the two team spawns |
| `walls:map/build_wall`, `walls:state/drop/tick` | the wall volume, raised and then taken down |
| `walls:evoker/spawn` | where the mid evoker lands |
| `walls:on/introstart`, `walls:end/finish` | the forceload region |

### The wall

The pack builds the wall itself rather than expecting it in the map, so the
removal is guaranteed to match what was placed. It is the X=30000 column,
Z 59872..60127, from Y=−59 (just above the world's own bedrock floor) up to the
Y=319 build limit — tall enough that nobody pillars over it or pearls through
it, and deep enough that nobody tunnels under it.

Raising it replaces everything in that column, terrain included. Taking it down
therefore does **not** just clear the column, which would leave a 1-block wide,
380-deep trench splitting the map. Each slice gets two fills:

- Y 64..319 → `air replace bedrock`, opening the crossing
- Y −59..63 → `stone replace bedrock`, a flush seam at ground level that also
  closes off the tunnel the wall's footprint would otherwise leave

That assumes ground level is Y=63 with players standing at 64. Terrain along the
wall line that is not flat gets sliced level at 63.

Both directions run one 32-block slice per tick, 8 slices: each fill stays well
under the 32768 block command limit, and ~97k block changes do not land as a
single lag spike. The build runs during the intro cutscene, chained with
`schedule`, because MAIN does not tick this pack until the game starts.

If a game is force-ended before 10 minutes, the wall is left standing —
`walls:end/finish` does not tear it down, since a normally finished match has
already removed it.

The arena is force-loaded for the whole game, as **four 8×8-chunk quadrants**
(released in `walls:end/finish`). `forceload add` is capped at 256 chunks per
command, and `29872 59872 30128 60128` is one block too wide — that is 17×17 =
289 chunks, so the command fails and force-loads *nothing*. The arena proper is
29872..30127, exactly 16×16 chunks.

This matters more than it looks. Without the forceload, the wall fill fails
silently, and every selector in the pack misses entities in whatever corner has
nobody standing in it: towers vanish from the bossbar totals, and an empty
tower selector reads as "that team lost".

## The towers

Each team defends two **ravagers**, one per corner of their own half, glowing in
their team's colour, 300 HP each and scaled to **2.0**. Both of a team's towers
share one 600 HP bossbar, `notched_6`. Internally they are `walls.tower*`
everywhere, so the entity type is named only in the selectors — this is the
third mob to hold the job.

Wardens came first and fought us at every turn: a command-summoned warden has no
dig cooldown so it tunnels out on its first tick, naming it only prevents the
*other* despawn, riding a Marker armor stand to stop the digging did not stick,
and its targeting needs ~80 anger points of vibrations before it swings at
anybody. Iron golems replaced them and turned out to have a worse problem:
**an iron ingot heals an iron golem 25 HP on right-click**, vanilla, not
switchable off, and the Miner sells iron — so a team could nurse its objectives
back up faster than the other side could chew through them. Nothing heals a
ravager off an item, which is why they hold the job now.

- **Their AI is off (`NoAI`) and this pack does the attacking.** A ravager's own
  brain charges off its post after whatever it noticed last, is hostile to both
  teams indiscriminately, and gets stunned for 40 ticks by a raised shield.
  None of that suits a fixed objective.
- `walls:tower/melee` swings every 30 ticks for 15 damage to everything on the
  opposing team within 5 blocks. The radius is wide because a scale-2.0 ravager
  is nearly 4 blocks across on its own. Both numbers are marked `### TUNING ###`
  in `walls:tower/melee_hit`. Targeting is by team tag, so there is no anger, no
  line of sight and no warm-up. Players in creative or spectator are skipped on
  purpose, so admins can stand next to one — **which means attacks look broken
  if you test them in creative.**
- The damage goes through `minecraft:mob_attack`, so armour reduces it and a
  raised shield blocks it, exactly as a real ravager's swing would be.
- There is **no ranged attack**. The wardens had a driven sonic boom; a ravager
  has nothing to replace it with, so a player with a bow can chip a tower down
  from outside its reach. If that turns out to be too easy, the knobs are the
  melee numbers above, `max_health` in `walls:map/summon_tower`, or a driven
  ranged hit modelled on `walls:tower/melee`.
- Kills they land are credited to the ravager, so under MAIN's rules nobody is
  the killer and the victim's 5 crystals drop on the ground where they fell.
- **They cannot be moved.** `NoGravity` keeps them standing when TNT takes the
  ground out from under them, and `walls:tower/tick` puts any tower that drifted
  more than 0.3 blocks off its anchor marker back on it — a mob with no AI can
  still be shoved by a player walking into it. The anchors are invisible Marker
  armor stands, position markers rather than vehicles. `yaw` per post points
  each one in towards the middle of the map.
- `walls:tower/watchdog` re-summons any tower that is missing, once a second,
  **during phases 0 and 1 only**. They are invulnerable until the wall drops, so
  one that is gone before then cannot have died — after the drop a dead tower
  has to stay dead. It tells `@a[tag=admin]` when it fires.
- **The summon NBT is kept to the fields the shop villagers already prove work
  on this version**, and everything else (`max_health`, `scale`, the knockback
  resistances, `NoGravity`, `Glowing`) is applied afterwards by command. Entity
  NBT is validated as one unit: one field this version does not recognise makes
  the whole `summon` fail and you get no tower, with nothing in chat to say so.
  An inline `attributes` list did exactly that.
- **`max_health` does not raise current health.** Raising the attribute to 300
  leaves the ravager on its base 100, which is what made the bossbars start a
  third full. `walls:map/summon_tower` therefore sets `Health:300f` with a
  `data merge` straight after the attribute, and backs it up with
  `instant_health` at **amplifier 7** (512 HP). The original line used amplifier
  30, and levels 30–32 of Instant Health heal *nothing at all* when applied with
  `/effect` — so it silently did nothing. Never use a huge amplifier as a
  "top it up" trick; pick one that covers the max you actually want.
- They are `Invulnerable` until the wall drops, so nobody can sabotage their own
  towers during the build phase.
- A bought zombie or skeleton spawner is stamped with its buyer's team, and
  friendly fire is off, so those mobs cannot chew on their own side's towers but
  will happily attack the enemy's. That is a legitimate siege route.
- Poison can never land a killing blow, so sudden death only leaves them on
  1 HP — it does not end the game by itself. That is what the 30 minute
  backstop in `walls:state/fight/tick` is for; delete those two lines for a
  pure "last towers standing" game. (Ravagers are not undead, so poison does
  tick them down.)

## The mid evoker

Every 3 minutes from the moment the wall drops, one evoker spawns at
30000 64 60000 — 100 HP, also scaled to 2.0, glowing, worth 15 💠 and 25 💎 to
whoever lands the kill. One at a time: if the last one is still alive, the slot
is skipped.

Unlike the defenders it **keeps its AI**. It picks its own targets, throws
armour-piercing fangs, summons vexes and is hostile to both teams, which is the
point of putting a bounty in no-man's land. `walls:evoker/track` follows it so
`walls:evoker/resolve` knows where to drop the 15 crystals if it dies to
something that is not a player.

**It drops nothing.** `data/minecraft/loot_table/entities/evoker.json` overrides
the vanilla table with an empty pool list, because an evoker's totem of undying
is a guaranteed drop and would hand out free extra lives. Overriding a vanilla
loot table is safe here only because evokers appear in no other game on this
server — that override is global. XP still drops, since experience does not come
from the loot table. If a totem ever does appear, add
`DeathLootTable:"minecraft:empty"` to the summon in `walls:evoker/spawn`.

Its vexes and fangs are swept up by `walls:end/finish` along with everything
else this pack put in the world.

## Economy

Crystals are plain `prismarine_crystals`, no NBT — 8 to start, and nothing is
ever re-issued on respawn (`keep_inventory` is on).

| Event | Payout |
|---|---|
| Kill with a credited killer | killer +5, victim +1 |
| Kill with no credited killer | 5 dropped where the victim died |
| Evoker, credited | killer +15, each of their teammates +2 |
| Evoker, no killer | 15 dropped where it fell |

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

Each villager's recipes are assembled in the `walls:shop offers` storage and
handed over with a single `data modify entity ... Offers.Recipes set from`.
Appending onto the villager directly does not work: **a villager with no trades
writes no `Offers` field at all**, so `Offers.Recipes` is not yet a path, and
every `append` fails leaving a shopkeeper with an empty trade window. `set`
creates the path, `append` needs it to exist already.

Three of the trades need explaining:

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

## Debugging

| Command | Does |
|---|---|
| `/function walls:debug/check` | prints chunk load state per corner, tower count and per-tower health, shop villager count and trade count each, whether the wall is still there, and the phase/timer/superstate |
| `/function walls:debug/skip_to_drop` | moves the match clock to 9:55 so the drop and the endgame can be tested without sitting out the build phase |
| `/function walls:debug/rebuild_map` | force-loads the arena and replaces the towers and shops, without running an intro |

If the towers are missing, the win check is **deliberately** disabled: an empty
tower selector would otherwise read as "that team lost", so `walls:map/setup`
and `walls:on/gamestart` only arm it when all four are present, and warn
`@a[tag=admin]` when they are not. A game with no towers runs to the 30 minute
backstop rather than ending instantly. That is the guard, not broken win logic.

Errors inside a function go to `latest.log` only, never to chat. To see why a
command in this pack failed, paste that command into chat by hand.

`walls:debug/check` is the first thing to run when something did not appear.
"NOT LOADED" on any corner means the forceload did not take, and that alone
explains missing towers, a bossbar that starts part-full, and a wall that
never drops. A bossbar that starts *exactly* a third full is the other bug —
see the `max_health` note under The towers.

## Before this can run

1. **Register the pack with MAIN.** MAIN dispatches by namespace from the
   `main:game` display list in `MAIN/data/main/function/_load.mcfunction`.
   Swap one of the six entries for
   `{id:N,namespace:"walls",gamename:"Walls"}`. Nothing else in this pack
   touches MAIN.
2. **Check the Y coordinates** in the files listed under Map config. They assume
   the top solid block is Y=63 and entities stand at Y=64.
3. Confirm the arena's **outer** edge is sealed — this pack builds the middle
   wall but sets no world border, because one left behind by a crashed game
   would damage everyone standing in the lobby at 0/50000.

## Gamerules

`walls:util/gamerules` starts from `main:util/reset_gamerules` and turns the
survival half back on: block/entity/mob drops, random ticks, natural
regeneration, working spawner blocks, `difficulty normal` (on peaceful the
bought spawners do nothing). Natural mob spawning stays off — every mob in this game
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
| `?next_evoker` | `walls.timer` | match time the next mid evoker is due |
| `?wall_step` | `walls.state` | which wall slice is next |
| `?evoker_state` | `walls.state` | 0 none, 1 alive, 2 just died |
| `?evoker_claimed` | `walls.state` | a player has been paid for this evoker |
| `?tower_melee` | `walls.timer` | ticks until the towers swing again |
| `?it_towers` / `?data_towers` | `walls.state` | towers still standing |
| `?ready` | `walls.state` | the win check is allowed to fire |
| `?sudden_death` | `walls.state` | poison has been applied |

Per-player: `walls.respawn` (ticks left as a spectator), `walls.x/y/z` (last
living position), `walls.st.kills` and `walls.st.cryst` (outro leaderboards).
