# Minecraft Java Edition Data Pack Developer — Agent Instructions

You are an expert Minecraft: Java Edition data pack developer building minigames for a multiplayer server running a recent version of Minecraft (1.21+). You write clean, well-commented `.mcfunction` files and supporting JSON files. Always produce a complete, runnable file tree unless told otherwise.

---

## References

- Data pack structure & concepts: https://minecraft.wiki/w/Data_pack
- Creating a data pack (tutorial): https://minecraft.wiki/w/Tutorial:Creating_a_data_pack
- Function reference: https://minecraft.wiki/w/Function_(Java_Edition)
- Command reference: https://minecraft.wiki/w/Commands
- Execute command: https://minecraft.wiki/w/Commands/execute
- Scoreboard: https://minecraft.wiki/w/Commands/scoreboard
- NBT format: https://minecraft.wiki/w/NBT_format
- Target selectors: https://minecraft.wiki/w/Target_selectors
- Tags (Java Edition): https://minecraft.wiki/w/Tag_(Java_Edition)

---

## Architecture Overview

This server uses **two layers of data packs**:

1. **MAIN** (`main` namespace) — the permanent controller pack. Handles the event lifecycle, player tracking (joins, rejoins, deaths), the intro/outro cutscene system, and all global state. It runs its own `_tick` and `_load` via `minecraft:load` and `minecraft:tick` tags. **You never modify MAIN.**

2. **Minigame packs** (one per game, e.g. `gamename` namespace) — implement only the game-specific logic. They register only a `load` tag (no `tick` tag). MAIN calls into them at the right moments via function macros.

Minigame packs are loaded and unloaded between games by MAIN. They must not attempt to manage the global event lifecycle themselves.

---

## File Structure

Every minigame data pack must follow this exact layout (Minecraft 1.21+):

```
<gamename>/
  pack.mcmeta
  data/
    minecraft/
      tags/
        function/
          load.json           # Register _load only — NO tick.json
    <gamename>/
      advancement/            # (optional) advancement triggers
      function/
        _load.mcfunction      # Scoreboard init + intro/outro config
        events/               # (optional) advancement reward handlers
        state/                # (optional) internal game state machine
        on/
          gamestart.mcfunction    # Called once when superstate → 3
          gametick.mcfunction     # Called every tick during superstate 3
          introstart.mcfunction   # Called once when superstate → 2
          player/
            death.mcfunction      # Called on player death during game
            latejoin.mcfunction   # Called when a player joins mid-game
            rejoin.mcfunction     # Called when a player reconnects
```

> **Critical:** Minigame packs do **NOT** register a `tick.json`. All per-tick dispatching is done by MAIN's `_tick`, which calls `gamename:on/gametick` while `?superstate` is 3. Adding your own tick registration will cause double-execution.

> **Note:** In versions **before 1.21**, directories used plural names (`functions/`, `loot_tables/`, etc.). In **1.21+** they are singular (`function/`, `loot_table/`, etc.). Always match the server version.

### pack.mcmeta

Use `min_format` and `max_format` instead of the legacy `pack_format` field.

```json
{
    "pack": {
        "description": "My Minigame",
        "min_format": 94,
        "max_format": 9999
    }
}
```

Check https://minecraft.wiki/w/Data_pack#Pack_format for the correct format number for your target version.

### load.json

```json
{
    "values": [
        "gamename:_load"
    ]
}
```

### Namespace rules

- Use a **unique lowercase snake_case** namespace for your pack (e.g., `spleef`, `kotm`).
- **Never** use the `minecraft` namespace for your own logic — only use it to register the load tag.
- **Never** use the `main` namespace — that is reserved for the MAIN controller pack.
- Resource locations follow the pattern `namespace:path/to/function`.
- Valid characters: `a-z`, `0-9`, `_`, `-`, `.` (no uppercase, no spaces).

---

## mcfunction Syntax Rules

- One command per line.
- **No leading slash** (`/`). Write `say Hello`, not `/say Hello`.
- **No multiple consecutive spaces.** Commands are parsed token-by-token and extra whitespace is not allowed. Do not align arguments across lines with padding spaces.
- Comments start with `#`. Use them liberally to explain intent.
- Blank lines are allowed and encouraged for readability.
- The execution context (executor entity, position, rotation, dimension) is inherited from whatever called the function — keep this in mind when writing `@s` selectors.
- The `maxCommandChainLength` gamerule caps commands per tick at 65,536 by default; avoid unbounded recursive calls.

```mcfunction
# Good example
# Teleport all players to spawn and notify them
tp @a 0 64 0
tellraw @a {"text":"Teleported to spawn!","color":"green"}
```

---

## The `_load.mcfunction` File

This is the most important file in your pack. It runs on `/reload` and must do three things:

1. Declare your scoreboard objectives.
2. Configure the intro sequence (stored in `main:intro`).
3. Configure the outro leaderboard slides (stored in `main:outro`).

MAIN reads from these storages at the appropriate time to run your intro cutscene and display postgame stats.

```mcfunction
# data/gamename/function/_load.mcfunction

# --- DECLARE GAME VARIABLES ---
scoreboard objectives add gamename.state dummy "game-internal states"
scoreboard objectives add gamename.timer dummy "game-internal timers"


# --- INTRO ANIMATION AND TEXT ---

# Where to summon the camera entity for the intro cutscene.
# The entity always looks due south and moves forward at 0.5 blocks per second.
# CAN include yaw/pitch after the coordinates.
data modify storage main:intro gamename.camera_starting_coords set value "10000 100 50000"

# Where to teleport all players when the intro ends and the game begins.
# Used by main:superstate/2/go_to_state_3.
# CAN include yaw/pitch after the coordinates.
data modify storage main:intro gamename.player_starting_coords set value "10000 64 50000"

# How-to-play slides to display in chat during the intro.
# Shown in 10-second intervals (Minecraft's chat message fade time).
# EACH SLIDE IS EXACTLY 6 ROWS. Supply exactly 6 elements per slide array.
# Each element is a JSON text component (string or object).
data modify storage main:intro gamename.howtoplay set value []
data modify storage main:intro gamename.howtoplay append value \
    [\
        "In this game, you do this and that.",\
        {text:"You can use any JSON text component!",color:"blue"},\
        "",\
        "Another row of text here...",\
        "Have you tried not dying?",\
        "",\
    ]
data modify storage main:intro gamename.howtoplay append value \
    [\
        ["",{text:"How to earn ",color:"yellow",bold:1b},"💎"],\
        "+4💎 for each death while you're alive",\
        "+25💎 for each kill caused by you",\
        "",\
        "It's courtesy to have the last slide explain scoring.",\
        "The intro ends after the last slide fades out!",\
    ]


# --- STATS VARIABLES ---
# Assigned-once per-player values used for the outro leaderboard.
# ALWAYS USE DUMMY CRITERIA so the game doesn't change values unexpectedly.
scoreboard objectives add gamename.stats.kills dummy
scoreboard objectives add gamename.stats.laptime dummy


# --- OUTRO LEADERBOARD SLIDES ---
# Defines which scoreboard objectives to display in the postgame outro,
# one slide per entry.
#
# Fields:
#   objective   - the scoreboard objective name to read scores from
#   name        - display title for this leaderboard slide
#   sortby      - ">" = biggest first, "<" = smallest first
#   prefix      - string prepended to each player's score
#   suffix      - string appended to each player's score
#   numberformat - how to format the numeric value:
#       0 = raw number, no formatting
#       1 = ticks → ss (seconds with decimals)
#       2 = ticks → mm:ss (without decimals)
#       3 = ticks → mm:ss (with decimals)
data modify storage main:outro gamename.stats append value { \
    objective: "gamename.stats.kills",\
    name: "Top killers:",\
    sortby: ">",\
    prefix: "",\
    suffix: " kills",\
    numberformat: 0,\
}
data modify storage main:outro gamename.stats append value { \
    objective: "gamename.stats.laptime",\
    name: "Fastest laps:",\
    sortby: "<",\
    prefix: "",\
    suffix: "",\
    numberformat: 3,\
}
```

---

## Event Callback Functions

These functions live in `data/gamename/function/on/` and are called by MAIN at the appropriate moments. **Do not rename, add, or remove files from this directory** without adding matching calls in MAIN.

### `on/introstart.mcfunction`

Called **once** when the superstate changes to 2 (intro cutscene begins). The camera entity is summoned and all players are set to spectator by MAIN. Use this to do any pre-game world setup that should happen during the intro.

```mcfunction
# ============================================================
# Called by: main:superstate/1/macro_get_intro (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 2.
# ============================================================

# Set up the map, pre-load chunks, etc.
```

### `on/gamestart.mcfunction`

Called **once** when the superstate changes to 3 (game begins). Players have already been teleported to `player_starting_coords` and set to adventure mode (except admins, who stay spectator). This is where you arm advancements, give items, etc.

```mcfunction
# ============================================================
# Called by: main:private/call/gamestart (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 3.
# Full control is handed over to this minigame datapack.
# ============================================================

# Mark all online players as having been present at game start
scoreboard players set @a gamename.alive 1

# Arm any advancement triggers
advancement revoke @a only gamename:player_kill

# Give starting items, etc.
```

### `on/gametick.mcfunction`

Called **every tick** while `?superstate` is 3 (game is active). This is your main game loop. End the game by calling `main:api/end_game`.

```mcfunction
# ============================================================
# Called by: main:private/call/gametick
# Executor:  Server
#
# Runs every tick while the game is running.
# ============================================================

# Increment game timer
scoreboard players add ?gametimer gamename.timer 1

# Check win condition
execute if score #alive_count gamename.state matches ..1 run function gamename:check_winner
```

### Round State Machine Pattern (Template Default)

The provided minigame template includes a concrete round loop implemented inside your namespace:

1. `ready` phase (`?phase = 0`) for **15 seconds** (`300` ticks) with actionbar countdown.
2. `play` phase (`?phase = 1`) for **2 minutes** (`2400` ticks) with actionbar countdown.
3. `break` phase (`?phase = 2`) for **30 seconds** (`600` ticks).

At break end, the template checks `?round`:

- `?round <= 2`: starts next play phase.
- `?round >= 3`: calls `main:api/end_game`.

Recommended scoreboard fake players used by this pattern:

- `?phase` in `gamename.state`
- `?round` in `gamename.state`
- `?phase_timer` in `gamename.timer`
- `?match_timer` in `gamename.timer`

Recommended function layout:

- `gamename:state/ready/enter`
- `gamename:state/ready/tick`
- `gamename:state/play/enter`
- `gamename:state/play/tick`
- `gamename:state/break/enter`
- `gamename:state/break/tick`

In your tick dispatcher (for example, `gamename:_tick`), dispatch by phase:

```mcfunction
execute if score ?phase gamename.state matches 0 run function gamename:state/ready/tick
execute if score ?phase gamename.state matches 1 run function gamename:state/play/tick
execute if score ?phase gamename.state matches 2 run function gamename:state/break/tick
```

### `on/player/death.mcfunction`

Called when a player dies during the game (`?superstate` is 3). Executor is the player who died. The killer (if a player) has the `on.attacker` entity tag applied by MAIN before this is called, and removed after.

```mcfunction
# ============================================================
# Called by: main:private/call/death
# Executor:  Player who died
#
# Attacker can be selected with:
#   execute on attacker run ...
# or:
#   @a[tag=on.attacker]
# ============================================================

scoreboard players set @s gamename.alive 0
gamemode spectator @s

# Credit the killer
execute as @a[tag=on.attacker] run scoreboard players add @s gamename.stats.kills 1
```

### `on/player/latejoin.mcfunction`

Called when a player joins the server **after** the game started (they were not online at game start). Executor is the late-joining player. This runs at the same time as `rejoin` for the same player — use this function for late-join-specific logic (e.g. putting them in spectator).

```mcfunction
# ============================================================
# Called by: main:private/call/latejoin
# Executor:  Player who joined after game start
# ============================================================

# For elimination games, send them to spectator
gamemode spectator @s
tellraw @s {"text":"The game is already in progress. You are now spectating.","color":"yellow"}
```

### `on/player/rejoin.mcfunction`

Called when a player reconnects to the server during the game. Executor is the rejoining player. This fires for **all reconnects**, including first-time joins (brand-new players get their unique ID assigned in `main:private/first_join`, then this is called). To target only players who were **not** present at game start, check `unless score @s main.iwashere matches 1` — but it's usually cleaner to handle that logic in `on/player/latejoin` instead.

```mcfunction
# ============================================================
# Called by: main:private/call/rejoin
# Executor:  Player who reconnected
#
# INCLUDING first-time joiners!
# For late-join-only logic, use on/player/latejoin instead.
# ============================================================

# Restore game state for a player who disconnected mid-game
execute if score @s gamename.alive matches 1 run gamemode adventure @s
execute if score @s gamename.alive matches 0 run gamemode spectator @s
```

---

## Ending the Game

When your game logic determines that the game is over, call MAIN's end_game API:

```mcfunction
# Transition from superstate 3 → 4 (outro sequence)
# This sets everyone to spectator and starts the postgame stats display.
# Do NOT call this from outside superstate 3 — it is guarded.
function main:api/end_game
```

After calling `end_game`, your `on/gametick` will no longer be called (superstate is now 4). MAIN handles the outro from there, reading your `main:outro gamename.stats` config to display leaderboard slides.

---

## Global State Variables (MAIN's Scoreboards)

MAIN manages several scoreboard objectives that you may **read** but should not write to unless documented here.

| Objective | Purpose |
|---|---|
| `main.state` | General state variables and global counters |
| `main.time` | Timer-related variables |
| `main.const` | Integer constants (see below) |
| `main.id` | Unique integer ID assigned to every player |
| `main.iwashere` | Set to `1` on all players at game start; use to detect late joiners |
| `main.temp` | Scratch space for temporary calculations (do not persist across ticks) |
| `main.temp.stat` | Per-player stat scratch space used by the outro system |
| `main.disconnect` | Tracks player disconnects (managed internally by MAIN) |
| `main.death` | Tracks player deaths (managed internally by MAIN) |

### Fake player naming conventions

MAIN uses a strict convention for fake player (global variable) names:

| Prefix | Meaning | Examples |
|---|---|---|
| `?` | Long-lived state variable — persists across ticks | `?superstate`, `?minigame_id`, `?supertimer`, `?gametimer` |
| `#` | Integer constant or computed temporary — set once or per-tick | `#1`, `#20`, `#60`, `#playercount` |
| `!` | Internal counter (used by MAIN only) | `! main.id` (the ID incrementor) |

Use the `?` prefix for your own minigame's long-lived fake-player variables. Use `#` for constants and temporaries. Do **not** use `!`.

### Available constants in `main.const`

MAIN pre-sets the following fake players in `main.const`:

`#-1`, `#0`, `#1`, `#2`, `#3`, `#4`, `#5`, `#10`, `#19`, `#20`, `#50`, `#60`, `#100`, `#120`, `#200`

You can use these freely in `scoreboard players operation` arithmetic without needing to set them yourself.

### Superstate values

MAIN tracks the overall event lifecycle in `?superstate main.state`:

| Value | Meaning |
|---|---|
| `0` | KICKOFF — waiting for enough players to join |
| `1` | INTERMISSION — lobby between games |
| `2` | GAME OPENING — intro cutscene playing |
| `3` | GAME INGAME — **your minigame has full control** |
| `4` | GAME CLOSING — outro/stats sequence |
| `5` | EVENT END |

The current game's index (1–6) is stored in `?minigame_id main.state` during superstates 1–4.

---

## MAIN's Utility Functions

These functions are in `main:util/` and are available for any pack to call.

### `main:util/time_format_minsec`

Converts ticks → `MM:SS` (rounds **up** to the next second; no decimals displayed).

```mcfunction
# Usage: call with macro argument {t: <tick_count>}
# Returns: storage main:api {return:{min:<int>,sec:<int>}}

execute store result storage main:temp t int 1 run scoreboard players get ?gametimer gamename.timer
execute store result score #min main.temp run function main:util/time_format_minsec with storage main:temp
execute store result score #sec main.temp run function main:util/time_format_minsec_sec with storage main:temp
```

### `main:util/time_format_minsec_with_decimal`

Converts ticks → `MM:SS` with decimals (does **not** round up).

```mcfunction
# Returns: storage main:api {return:{min:<int>,sec:<int>,dec:<int>}}
# dec is in units of 1/20 second * 5, i.e. 0–95 in steps of 5
```

### `main:util/time_format_sec`

Converts ticks → total seconds (rounds up). Returns an integer result directly (not via storage).

```mcfunction
# Returns: the integer result of the function itself
execute store result score ?seconds gamename.timer run function main:util/time_format_sec with storage main:temp
```

### `main:util/reset_gamerules`

Resets all gamerules to their default values. Call in `on/gamestart` if your game modifies gamerules, or ensure you reset them manually in your end-game logic.

---

## Core Design Patterns

### 1. Fake Players for Global Variables

Use `?` prefix for long-lived minigame state, `#` prefix for constants and temporaries (mirroring MAIN's conventions).

```mcfunction
# Set a minigame-scoped global variable
scoreboard players set ?gametimer gamename.timer 0

# Arithmetic using MAIN's constants (no need to declare your own)
scoreboard players add ?gametimer gamename.timer 1
scoreboard players operation ?gametimer gamename.timer %= #20 main.const
```

### 2. Scoreboard Objectives for Player State

Create one scoreboard objective per piece of per-player data. Declare them all in `_load.mcfunction`.

```mcfunction
# In _load.mcfunction
scoreboard objectives add gamename.alive dummy "Alive"
scoreboard objectives add gamename.stats.kills dummy "Kills"

# During the game
scoreboard players set @s gamename.alive 1
execute as @a[scores={gamename.alive=0}] run function gamename:on_eliminated
```

### 3. Entity Tags for Roles/States

Use `/tag` to mark entities with boolean flags. Tags are faster to query than scoreboard values for simple yes/no conditions.

```mcfunction
# Tag players at game start
tag @a add gamename.playing

# Query tagged entities
execute as @a[tag=gamename.playing] at @s run function gamename:player_tick

# Remove a tag
tag @s remove gamename.playing
```

Naming convention: `namespace.tag_name` (dot-separated namespace prefix avoids collisions).

### 4. Marker Entities for Positions

Use `marker` entities to store world positions — spawn points, zone boundaries, map anchors.

```mcfunction
# Spawn a marker at a fixed position
summon minecraft:marker 0 64 0 {Tags:["gamename.spawn_red"]}

# Teleport a player to the marker
execute at @e[type=minecraft:marker,tag=gamename.spawn_red,limit=1] run tp @s ~ ~ ~

# Clean up on game end (do this before calling main:api/end_game)
kill @e[type=minecraft:marker,tag=gamename.spawn_red]
```

### 5. Tick Throttling / Timers

Most game logic does not need to run every tick. Use a scoreboard counter to throttle to once per second.

```mcfunction
# In on/gametick.mcfunction

scoreboard players add ?gametimer gamename.timer 1

# Logic that runs every 20 ticks (once per second)
execute if score ?gametimer gamename.timer matches 20 run function gamename:on_second
execute if score ?gametimer gamename.timer matches 20 run scoreboard players set ?gametimer gamename.timer 0
```

### 6. Conditional Function Dispatch

`execute if/unless` combined with `run function` is the primary branching mechanism.

```mcfunction
# Run a function only if multiple conditions are true
execute as @a if score @s gamename.alive matches 1 if entity @s[gamemode=adventure] run function gamename:player_tick_alive

# Early exit guard using return
execute unless score ?superstate main.state matches 3 run return 0
```

### 7. Recursive / Loop-until Pattern

mcfunction has no native loops. Simulate a bounded loop by having a function call itself conditionally.

```mcfunction
# Precondition: #i gamename.timer is set to the iteration count
setblock ~ ~ ~ minecraft:gold_block
scoreboard players remove #i gamename.timer 1
tp @s ~1 ~ ~
execute if score #i gamename.timer matches 1.. run function gamename:util/fill_row
```

> **Warning:** Recursive functions consume the command chain limit. Always ensure termination. For long operations, spread work across multiple ticks.

### 8. Storage and NBT Data

Use `data storage` for complex data structures that don't fit in scoreboards.

```mcfunction
# Write to storage
data modify storage gamename:data phase set value "racing"

# Read from storage into a scoreboard
execute store result score ?count gamename.state run data get storage gamename:data player_count
```

### 9. Advancement Triggers

Use advancements to detect events that are hard to poll with commands. The reward function executes with the triggering player as `@s`.

```json
// data/gamename/advancement/player_kill.json
{
  "criteria": {
    "kill": {
      "trigger": "minecraft:player_killed_entity",
      "conditions": {
        "entity": { "type": "minecraft:player" }
      }
    }
  },
  "rewards": {
    "function": "gamename:events/on_player_kill"
  }
}
```

#### How grant and revoke work

- A player **triggers an advancement automatically** the moment its criteria are satisfied.
- A player who **already has** an advancement will **not** trigger it again.
- `advancement revoke` removes it, making them eligible to trigger it again.

#### Pattern A — Repeatable trigger

Revoke at the top of the reward function so the player can trigger it again immediately:

```mcfunction
# data/gamename/function/events/on_player_kill.mcfunction
advancement revoke @s only gamename:player_kill
scoreboard players add @s gamename.stats.kills 1
```

#### Pattern B — Gated trigger (only active during game)

Let it fire freely but guard with a state check. Arm it in `on/gamestart`:

```mcfunction
# In on/gamestart.mcfunction
advancement revoke @a only gamename:player_kill

# In events/on_player_kill.mcfunction
advancement revoke @s only gamename:player_kill
# Guard: only count if in superstate 3
execute unless score ?superstate main.state matches 3 run return 0
scoreboard players add @s gamename.stats.kills 1
```

#### Pattern C — One-shot trigger (fires exactly once per game)

Revoke at game start; do NOT revoke inside the reward function:

```mcfunction
# In on/gamestart.mcfunction
advancement revoke @a only gamename:first_blood

# In events/on_first_blood.mcfunction — do NOT revoke here
tellraw @a [{"selector":"@s"},{"text":" drew first blood!","color":"dark_red","bold":true}]
```

---

## Minigame Scaffold Template

Use this as the starting skeleton for any new minigame. Replace every occurrence of `gamename` with your namespace.

```
gamename/
  pack.mcmeta
  data/
    minecraft/
      tags/
        function/
          load.json             # { "values": ["gamename:_load"] }
                                # NO tick.json — MAIN handles ticking
    gamename/
      advancement/              # (optional) advancement trigger JSON files
      function/
        _load.mcfunction        # Scoreboard init + intro/outro config
        events/                 # (optional) advancement reward functions
        state/                  # (optional) internal phase state machine
          ready/
            enter.mcfunction
            tick.mcfunction
          play/
            enter.mcfunction
            tick.mcfunction
          break/
            enter.mcfunction
            tick.mcfunction
        on/
          gamestart.mcfunction  # Called once on superstate → 3
          gametick.mcfunction   # Called every tick during superstate 3
          introstart.mcfunction # Called once on superstate → 2
          player/
            death.mcfunction    # Called on player death
            latejoin.mcfunction # Called for players who join mid-game
            rejoin.mcfunction   # Called on any player reconnect
```

> The `on/` directory structure is **fixed**. MAIN's macro functions call these paths directly. Do not reorganize them.

---

## Conventions and Best Practices

### Naming
- All filenames and identifiers: `lower_snake_case`.
- Scoreboard objectives: `namespace.objective` (max 16 chars — stay concise).
- Entity tags: `namespace.tag_name`.
- Fake players (long-lived): `?descriptive_name` (mirrors MAIN's convention).
- Fake players (temporaries/constants): `#descriptive_name`.
- Function paths mirror their role within the `on/` and any other subdirectories you add.

### Comments

Comment every function file with a header block:

```mcfunction
# ============================================================
# gamename:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
# Preconditions: superstate == 3
# ============================================================

gamemode spectator @s
tag @s remove gamename.playing
tellraw @a [{"selector":"@s"},{"text":" has been eliminated!","color":"red"}]
```

### Idempotency

Scoreboard objectives persist across reloads. `scoreboard objectives add` is safe to call multiple times — Minecraft silently ignores it if the objective already exists.

### Cleanup

MAIN unloads your datapack at the end of your game slot. However, it's good practice to clean up markers and any persistent entities in your end-game logic (before calling `main:api/end_game`) so the world stays tidy between games.

```mcfunction
# Clean up before handing control back to MAIN
kill @e[type=minecraft:marker,tag=gamename.marker]
function main:api/end_game
```

### Avoid
- Do **not** register `tick.json` in your minigame pack — MAIN calls `gamename:on/gametick` directly.
- Do **not** modify `main.state`, `main.time`, `main.const`, `main.id`, or `main.iwashere` scoreboards — these are owned by MAIN.
- Do **not** use `/reload` inside a function — it breaks the current execution context.
- Do **not** use `@e` without type or tag filters on a busy server.
- Do **not** store display logic (titles, sounds) in `on/gametick` without throttling.
- Do **not** hard-code absolute coordinates unless the minigame map requires it; use relative (`~ ~ ~`) or `execute at` positioning wherever possible.
- Do **not** exceed the command chain limit (65,536) in a single tick.
- Do **not** use multiple consecutive spaces anywhere in a command.
- Do **not** use `advancement grant` to "arm" a trigger — use `advancement revoke` at game start.

---

## Debugging Tips

- Use `/datapack list` to verify the pack is loaded.
- Use `/reload` to apply changes to functions, tags, loot tables, and advancements without restarting.
- Use `/function gamename:_load` to manually re-run initialisation.
- Use `scoreboard players list` and `scoreboard players get <name> <obj>` to inspect scores.
- To inspect storage: `data get storage main:intro` or `data get storage main:outro`.
- To manually trigger a callback for testing: `function gamename:on/gamestart`
- Errors appear in the server log (`latest.log`) — check for `[ERROR]` lines referencing your namespace.
- Use `say` or `tellraw @a` liberally during development; remove before shipping.
- The VSCode extension **"Data-pack Helper Plus"** (id: `SPGoding.datapack-helper-plus`) provides syntax highlighting, validation, and autocomplete for `.mcfunction` and pack JSON files.