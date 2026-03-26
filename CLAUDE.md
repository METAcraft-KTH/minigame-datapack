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

## File Structure

Every data pack must follow this exact layout (Minecraft 1.21+):

```
<pack_root>/
  pack.mcmeta
  data/
    <namespace>/
      function/               # .mcfunction files (singular in 1.21+)
      tags/
        function/             # Function tags (.json)
      loot_table/             # Loot tables (.json)
      advancement/            # Advancements (.json)
      recipe/                 # Recipes (.json)
      predicate/              # Predicates (.json)
    minecraft/
      tags/
        function/
          load.json           # Functions to run on world load
          tick.json           # Functions to run every tick
```

> **Note:** In versions **before 1.21**, directories used plural names (`functions/`, `loot_tables/`, etc.). In **1.21+** they are singular (`function/`, `loot_table/`, etc.). Always match the server version.

### pack.mcmeta

Use `min_format` and `max_format` instead of the legacy `pack_format` field. This tells Minecraft the range of pack format versions your pack is compatible with. Setting both to the same value pins the pack to a specific version.

```json
{
  "pack": {
    "min_format": 94,
    "max_format": 94,
    "description": "My Minigame"
  }
}
```

The example above targets Minecraft 1.21.11 (pack format `94`). Check https://minecraft.wiki/w/Data_pack#Pack_format for the correct format number for your target version.

### Namespace rules

- Use a **unique lowercase snake_case** namespace for your pack (e.g., `mygame`, `spleef_arena`).
- **Never** use the `minecraft` namespace for your own logic — only use it to register load/tick tags or override vanilla behaviour intentionally.
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

## Load and Tick Registration

### On-load initialisation

```
data/minecraft/tags/function/load.json
```
```json
{
  "values": ["mygame:setup/load"]
}
```

```
data/mygame/function/setup/load.mcfunction
```
```mcfunction
# Runs once when the world loads or /reload is used
# Create scoreboards (scoreboard objectives survive reload, so use add idempotently)
scoreboard objectives add mygame.state dummy "Game State"
scoreboard objectives add mygame.score dummy "Player Score"
scoreboard objectives add mygame.timer dummy "Timer"

tellraw @a {"text":"[MyGame] Data pack loaded.","color":"yellow"}
```

### Every-tick polling

```
data/minecraft/tags/function/tick.json
```
```json
{
  "values": ["mygame:tick/main"]
}
```

```
data/mygame/function/tick/main.mcfunction
```
```mcfunction
# Runs every game tick (20 times/second)
# Dispatch to the correct phase based on global game state
execute if score #state mygame.state matches 0 run function mygame:phase/idle
execute if score #state mygame.state matches 1 run function mygame:phase/lobby
execute if score #state mygame.state matches 2 run function mygame:phase/in_game
execute if score #state mygame.state matches 3 run function mygame:phase/ending
```

The `#state` entry uses the **fake player** convention (see below). Each phase function handles its own logic.

---

## Core Design Patterns

### 1. Fake Players for Global Variables

Use `#` as a prefix for "fake player" names in scoreboards to store server-wide variables that are not tied to any real entity.

```mcfunction
# Set a global variable
scoreboard players set #state mygame.state 2

# Read and branch on it
execute if score #state mygame.state matches 2 run function mygame:phase/in_game

# Arithmetic
scoreboard players add #timer mygame.timer 1
scoreboard players operation #timer mygame.timer %= #max_timer mygame.timer
```

Fake players appear nowhere in the player list and survive entity deaths — ideal for global state.

### 2. State Machine Pattern

Represent your minigame lifecycle as integer states in a scoreboard. Have the tick dispatcher branch to one handler function per state.

```
State 0 = IDLE      (waiting for enough players)
State 1 = LOBBY     (countdown before game starts)
State 2 = IN_GAME   (active play)
State 3 = ENDING    (results screen / cleanup)
```

Each phase function is responsible for:
- Running its own logic.
- Transitioning to the next state when appropriate (by setting `#state`).
- **Not** running logic that belongs to another state.

```mcfunction
# data/mygame/function/phase/lobby.mcfunction

# Count down the lobby timer
scoreboard players remove #lobby_timer mygame.timer 1

# Display countdown every second (every 20 ticks)
execute if score #lobby_timer mygame.timer matches 0.. run title @a times 5 10 5
execute if score #lobby_timer mygame.timer matches 20 run title @a title {"text":"3","color":"yellow"}
execute if score #lobby_timer mygame.timer matches 40 run title @a title {"text":"2","color":"gold"}
execute if score #lobby_timer mygame.timer matches 60 run title @a title {"text":"1","color":"red"}

# Transition to in-game when timer reaches 0
execute if score #lobby_timer mygame.timer matches ..0 run function mygame:phase/start_game
```

### 3. Scoreboard Objectives for Player State

Create one scoreboard objective per piece of per-player data.

```mcfunction
# In load.mcfunction
scoreboard objectives add mygame.kills dummy "Kills"
scoreboard objectives add mygame.deaths dummy "Deaths"
scoreboard objectives add mygame.alive dummy "Alive"

# Mark a player as alive
scoreboard players set @s mygame.alive 1

# Detect dead players (alive == 0) and spectate them
execute as @a[scores={mygame.alive=0}] run function mygame:player/on_eliminated
```

### 4. Entity Tags for Roles/States

Use `/tag` to mark entities with boolean flags. Tags are faster to query than scoreboard values for simple yes/no conditions.

```mcfunction
# Tag the game host
tag @s add mygame.host

# Tag all players who have spawned
tag @a add mygame.spawned

# Query tagged entities
execute as @a[tag=mygame.spawned] at @s run function mygame:player/tick

# Remove a tag
tag @s remove mygame.spawned
```

Naming convention: `namespace.tag_name` (dot-separated namespace prefix avoids collisions).

### 5. Marker Entities for Positions

Use `marker` entities (or `armor_stand` with `Marker:1b`) to store world positions without occupying any game logic. Useful for spawn points, zone boundaries, and map anchors.

```mcfunction
# Spawn a marker at a fixed position with a custom tag
summon minecraft:marker 0 64 0 {Tags:["mygame.spawn_red"]}

# Teleport a player to the marker's position
execute at @e[type=minecraft:marker,tag=mygame.spawn_red,limit=1] run tp @s ~ ~ ~

# Clean up all markers on game end
kill @e[type=minecraft:marker,tag=mygame.spawn_red]
```

### 6. Tick Throttling / Timers

Running every single logic branch on every tick is expensive and unnecessary. Use a scoreboard counter to throttle logic.

```mcfunction
# data/mygame/function/tick/main.mcfunction

# Increment a tick counter
scoreboard players add #tick mygame.timer 1

# Every 20 ticks (1 second), run the second-timer
execute if score #tick mygame.timer matches 20.. run function mygame:tick/on_second
execute if score #tick mygame.timer matches 20.. run scoreboard players set #tick mygame.timer 0
```

```mcfunction
# data/mygame/function/tick/on_second.mcfunction
# Logic that only needs to run once per second
scoreboard players remove #game_timer mygame.state 1
execute if score #game_timer mygame.state matches ..0 run function mygame:phase/game_over
```

### 7. Conditional Function Dispatch

`execute if/unless` combined with `run function` is the primary branching mechanism. Chain conditions for compound logic.

```mcfunction
# Run a function only if multiple conditions are true
execute as @a if score @s mygame.alive matches 1 if entity @s[gamemode=survival] run function mygame:player/tick_alive

# Negated condition
execute as @a unless score @s mygame.alive matches 1 run spectate
```

### 8. Recursive / Loop-until Pattern

mcfunction has no native loops. Simulate a bounded loop by having a function call itself conditionally.

```mcfunction
# data/mygame/util/fill_row.mcfunction
# Precondition: #i util.counter is set to the number of blocks to place
# Executes relative to starting position

setblock ~ ~ ~ minecraft:gold_block
scoreboard players remove #i mygame.timer 1
tp @s ~1 ~ ~
execute if score #i mygame.timer matches 1.. run function mygame:util/fill_row
```

> **Warning:** Recursive functions consume the command chain limit. Always ensure the recursion terminates. For long operations, prefer spreading work across multiple ticks.

### 9. Storage and NBT Data

Use `data storage` for complex data structures that don't fit in scoreboards (lists, compound values, strings).

```mcfunction
# Write to storage
data modify storage mygame:data game_phase set value "lobby"

# Read from storage into a scoreboard via execute store
execute store result score #count mygame.timer run data get storage mygame:data player_count

# Copy NBT from one entity to storage
data modify storage mygame:data last_winner set from entity @p CustomName
```

### 10. Advancement Triggers

Use advancements to detect events that are hard to poll with commands (e.g., killing specific mobs, crafting items, taking specific damage). The reward function executes with the triggering player as `@s`.

```json
// data/mygame/advancement/track/player_kill.json
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
    "function": "mygame:events/on_player_kill"
  }
}
```

#### How grant and revoke work

- A player **triggers an advancement automatically** the moment its criteria are satisfied — `advancement grant` is not required and should not be used to "arm" a trigger.
- A player who **already has** an advancement will **not** trigger it again.
- `advancement revoke` removes the advancement from the player, making them **eligible to trigger it again**. It does not prevent the trigger from firing in the future.

#### Pattern A — Repeatable trigger

To allow an advancement to fire multiple times, revoke it at the top of the reward function. The player is then immediately eligible for it again:

```mcfunction
# data/mygame/function/events/on_player_kill.mcfunction
# Revoke first so the player can trigger this advancement again next kill
advancement revoke @s only mygame:track/player_kill

scoreboard players add @s mygame.kills 1
```

#### Pattern B — Gated trigger (only active during certain game states)

You cannot prevent an advancement from firing with `revoke` alone — the player will re-earn it the moment the criteria are met again. To **gate** an advancement so it only has effect during a specific game phase, let it fire freely but add a state-check guard at the top of the reward function. Use `return` to bail out immediately if the conditions are not right:

```mcfunction
# data/mygame/function/events/on_player_kill.mcfunction

# Revoke immediately so the player can trigger this advancement again
advancement revoke @s only mygame:track/player_kill

# Guard: only count the kill if we are in the PVP phase (state == 3)
# return stops execution of the rest of this function
execute unless score #state mygame.state matches 3 run return 0

# We are in the correct state — process the kill
scoreboard players add @s mygame.kills 1
tellraw @a [{"selector":"@s"},{"text":" got a kill!","color":"red"}]
```

`return 0` exits the current function immediately. Nothing after it runs. This is the idiomatic way to implement early-exit guards in mcfunction.

#### Pattern C — One-shot trigger (fires exactly once per game)

Revoke the advancement at game start so all players are eligible, and do **not** revoke inside the reward function. The advancement will fire once per player and then never again until the next game start:

```mcfunction
# In your game-start function: make all players eligible
advancement revoke @a only mygame:track/first_blood

# In the reward function: do NOT revoke — let it stay granted
# data/mygame/function/events/on_first_blood.mcfunction
tellraw @a [{"selector":"@s"},{"text":" drew first blood!","color":"dark_red","bold":true}]
scoreboard players set #first_blood_claimed mygame.state 1
```

---

## Minigame Scaffold Template

Use this as the starting skeleton for any new minigame. Replace `mygame` with your namespace.

```
mygame/
  pack.mcmeta
  data/
    minecraft/
      tags/
        function/
          load.json
          tick.json
    mygame/
      function/
        setup/
          load.mcfunction       # scoreboard init, welcome message
          uninstall.mcfunction  # cleanup all scoreboards and entities (run manually)
        tick/
          main.mcfunction       # state dispatcher
          on_second.mcfunction  # 1-second throttled logic
        phase/
          idle.mcfunction       # waiting for players
          lobby.mcfunction      # pre-game countdown
          in_game.mcfunction    # active game logic
          ending.mcfunction     # results and cleanup
          start_game.mcfunction # transition: lobby → in_game
          game_over.mcfunction  # transition: in_game → ending
        player/
          on_join.mcfunction    # called when a player enters the arena
          on_eliminated.mcfunction
          on_win.mcfunction
        util/
          reset_scores.mcfunction
          broadcast.mcfunction
```

---

## Conventions and Best Practices

### Naming
- All filenames and identifiers: `lower_snake_case`.
- Scoreboard objectives: `namespace.objective` (max 16 chars — stay concise).
- Entity tags: `namespace.tag_name`.
- Fake players: `#descriptive_name`.
- Function paths mirror their role: `phase/`, `player/`, `util/`, `tick/`, `setup/`.

### Comments
Comment every function file with:
1. A header block describing what the function does, its preconditions, and who calls it.
2. Inline comments on any non-obvious command.

```mcfunction
# ============================================================
# mygame:player/on_eliminated
# Called when: a player's mygame.alive score reaches 0
# Executor:    the eliminated player (@s)
# ============================================================

# Switch to spectator so they can watch
gamemode spectator @s

# Remove from alive pool
tag @s remove mygame.spawned

# Notify everyone
tellraw @a [{"selector":"@s"},{"text":" has been eliminated!","color":"red"}]

# Check win condition — if only one player remains, end the game
execute if score #alive_count mygame.state matches ..1 run function mygame:phase/game_over
```

### Idempotency
Scoreboard objectives persist across reloads. Guard `objectives add` calls or accept the benign error in logs — it will not create duplicates.

```mcfunction
# This is safe to run multiple times; Minecraft silently ignores it if the objective exists
scoreboard objectives add mygame.state dummy "Game State"
```

### Cleanup / Uninstall
Always provide an `uninstall.mcfunction` that is **not** wired to load or tick. Operators can run it manually to fully remove your pack's data.

```mcfunction
# data/mygame/function/setup/uninstall.mcfunction
scoreboard objectives remove mygame.state
scoreboard objectives remove mygame.score
scoreboard objectives remove mygame.timer
kill @e[type=minecraft:marker,tag=mygame.marker]
tellraw @a {"text":"[MyGame] Uninstalled successfully.","color":"gray"}
```

### Avoid
- Do **not** use `/reload` inside a function — it breaks the current execution context.
- Do **not** use `@e` without type or tag filters on a busy server; it selects every loaded entity.
- Do **not** store display logic (titles, sounds) in tick functions that run every tick without throttling.
- Do **not** hard-code absolute coordinates unless the minigame map requires it; use relative (`~ ~ ~`) or `execute at` positioning wherever possible.
- Do **not** exceed the command chain limit (65,536) in a single tick — spread heavy work across multiple ticks.
- Do **not** use multiple consecutive spaces anywhere in a command. Minecraft's parser does not allow them, even for visual alignment. Each token must be separated by exactly one space.
- Do **not** use `advancement grant` to "arm" a trigger. Advancements fire automatically when criteria are met and the player does not already hold them. Use `advancement revoke` at game start (or inside the reward function) to control eligibility.

---

## Debugging Tips

- Use `/datapack list` to verify the pack is loaded.
- Use `/reload` to apply changes to functions, tags, loot tables, and advancements without restarting.
- Use `/function mygame:setup/load` to manually re-run initialisation.
- Use `scoreboard players list` and `scoreboard players get <name> <obj>` to inspect scores.
- Errors appear in the server log (`latest.log`) — check for `[ERROR]` lines referencing your namespace.
- Use `say` or `tellraw @a` liberally during development; remove before shipping.
- The VSCode extension **"Data-pack Helper Plus"** (id: `SPGoding.datapack-helper-plus`) provides syntax highlighting, validation, and autocomplete for `.mcfunction` and pack JSON files.