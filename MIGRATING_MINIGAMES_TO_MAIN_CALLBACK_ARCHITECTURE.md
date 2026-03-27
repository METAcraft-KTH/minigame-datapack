# AI Migration Guide: Old Minigame System -> MAIN Callback Architecture

This guide explains how to migrate a minigame datapack from the old self-managed architecture (example: old-spleef-tag) to the current MAIN callback architecture (example: spleef-tag).

## Scope

Use this guide when a minigame currently:
- Registers its own tick tag in data/minecraft/tags/function/tick.json
- Gates execution using game.id GLOBAL vs id <namespace>.config
- Manages full lifecycle states like lobby and postgame itself
- Uses GLOBAL.player_in_state and GLOBAL.player_left join plumbing per state

Do not use this guide to modify MAIN itself. MAIN is the permanent controller and must remain untouched.

## Core Migration Concept

Old system:
- Minigame owns orchestration and continuous ticking
- Minigame decides when it is active with game.id GLOBAL
- Minigame handles lifecycle start/end transitions and hands off to next game id

New system:
- MAIN owns orchestration and player event dispatch
- Minigame only implements callback endpoints under on/
- Minigame defines intro/outro data in _load
- Minigame ends by calling function main:api/end_game

## Evidence From Spleef Migration

Old architecture references:
- old-spleef-tag load tag points at spleef:load: [old-spleef-tag/data/minecraft/tags/function/load.json](old-spleef-tag/data/minecraft/tags/function/load.json#L3)
- old pack registers tick.json with spleef:tick: [old-spleef-tag/data/minecraft/tags/function/tick.json](old-spleef-tag/data/minecraft/tags/function/tick.json#L3)
- old tick is gated by game.id GLOBAL: [old-spleef-tag/data/spleef/function/tick.mcfunction](old-spleef-tag/data/spleef/function/tick.mcfunction#L2)
- old lifecycle exits by writing next game id: [old-spleef-tag/data/spleef/function/exit.mcfunction](old-spleef-tag/data/spleef/function/exit.mcfunction#L20)

New architecture references:
- new load tag points at spleef:_load: [spleef-tag/data/minecraft/tags/function/load.json](spleef-tag/data/minecraft/tags/function/load.json#L3)
- no tick.json is registered in new pack (only load)
- _load writes intro and outro storage: [spleef-tag/data/spleef/function/_load.mcfunction](spleef-tag/data/spleef/function/_load.mcfunction#L30)
- on/gametick delegates to internal dispatcher: [spleef-tag/data/spleef/function/on/gametick.mcfunction](spleef-tag/data/spleef/function/on/gametick.mcfunction#L7)
- final-round transition calls MAIN end API: [spleef-tag/data/spleef/function/states/ingame_freeze/tick.mcfunction](spleef-tag/data/spleef/function/states/ingame_freeze/tick.mcfunction#L36)

## Target File Layout (1.21+)

Required minimum for migrated minigame namespace <game>:

- pack.mcmeta
- data/minecraft/tags/function/load.json
- data/<game>/function/_load.mcfunction
- data/<game>/function/on/introstart.mcfunction
- data/<game>/function/on/gamestart.mcfunction
- data/<game>/function/on/gametick.mcfunction
- data/<game>/function/on/player/death.mcfunction
- data/<game>/function/on/player/latejoin.mcfunction
- data/<game>/function/on/player/rejoin.mcfunction

Optional but recommended:
- data/<game>/function/_tick.mcfunction (internal dispatcher)
- data/<game>/function/state/... or data/<game>/function/states/...
- data/<game>/advancement/* and data/<game>/function/events/*

Critical rule:
- Do not create or keep data/minecraft/tags/function/tick.json in the migrated pack.

## Old -> New Mapping

Lifecycle and entrypoints:
- old load.mcfunction -> new _load.mcfunction
- old tick.mcfunction main loop -> new on/gametick.mcfunction plus optional _tick.mcfunction
- old lobby/start + lobby/tick -> remove; MAIN intermission handles this
- old postgame/start + postgame/tick + exit.mcfunction -> remove; call main:api/end_game when win condition reached

State responsibilities:
- Keep gameplay phases (pregame/ingame_*), but invoke them from on/gamestart and _tick
- Remove game.id GLOBAL gating logic entirely
- Remove next-game-id assignment logic entirely

Player event handling:
- old per-state join/respawn/while_dead orchestration based on GLOBAL.player_left and GLOBAL.time_alive
- migrate state-sensitive behavior into:
  - on/player/death
  - on/player/latejoin
  - on/player/rejoin

Global scoreboards:
- Remove dependence on GLOBAL, GLOBAL.player_in_state, GLOBAL.player_left, GLOBAL.time_alive
- Keep minigame-local objectives under <game>.*
- Read main.* only when needed, and do not write MAIN-owned core lifecycle values

## Redundant File Consolidation (Alias Map)

In the old architecture, many per-state helper files are structural duplicates. In the new architecture, group them into shared callback files and keep phase-specific logic in one internal helper if needed.

Primary consolidation rules:
- Every states/*/join.mcfunction should be aliased or migrated to on/player/rejoin.mcfunction.
- Every states/*/while_dead.mcfunction should be merged into on/player/death.mcfunction if it represents elimination/death handling.
- Most states/*/respawn.mcfunction logic should be merged into on/player/rejoin.mcfunction or on/player/latejoin.mcfunction depending on intent.
- Most states/*/reset_player.mcfunction logic should be centralized into one shared helper called by on/gamestart and optionally on/player/rejoin.
- lobby/* and postgame/* should be removed as standalone lifecycle states because MAIN now owns intermission and outro.

Concrete old -> new alias examples (spleef):
- old-spleef-tag/data/spleef/function/states/ingame_spleef/join.mcfunction -> spleef-tag/data/spleef/function/on/player/rejoin.mcfunction
- old-spleef-tag/data/spleef/function/states/ingame_run/join.mcfunction -> spleef-tag/data/spleef/function/on/player/rejoin.mcfunction
- old-spleef-tag/data/spleef/function/states/ingame_freeze/join.mcfunction -> spleef-tag/data/spleef/function/on/player/rejoin.mcfunction
- old-spleef-tag/data/spleef/function/states/pregame/join.mcfunction -> spleef-tag/data/spleef/function/on/player/rejoin.mcfunction
- old-spleef-tag/data/spleef/function/states/lobby/join.mcfunction -> spleef-tag/data/spleef/function/on/player/latejoin.mcfunction (or remove, depending on game policy)
- old-spleef-tag/data/spleef/function/states/postgame/join.mcfunction -> spleef-tag/data/spleef/function/on/player/rejoin.mcfunction (usually spectator-safe behavior)

Redundant cluster matrix for old states/* files:
- join.mcfunction across all states -> on/player/rejoin.mcfunction
- while_dead.mcfunction across all states -> on/player/death.mcfunction (or remove if MAIN already covers desired behavior)
- respawn.mcfunction across all states -> on/player/rejoin.mcfunction and on/player/latejoin.mcfunction
- reset_player.mcfunction across all states -> states/common/reset_player.mcfunction (new shared helper), called from on/gamestart and on/player/rejoin
- configure_gamerule.mcfunction in pregame -> move to on/gamestart or a helper called by on/gamestart
- lobby/start.mcfunction + lobby/tick.mcfunction -> remove
- postgame/start.mcfunction + postgame/tick.mcfunction -> remove

Recommended alias strategy during transition:
- Phase 1 (safe migration): keep old file paths as wrappers that call the new callback or shared helper.
- Phase 2 (cleanup): delete wrappers after no references remain.

Wrapper example for temporary compatibility:

```mcfunction
# old path: states/ingame_spleef/join.mcfunction
function <game>:on/player/rejoin
```

When not to merge:
- If a state file has truly unique mechanics (for example, special scoring in ingame_freeze/points_for_surviving), keep it state-local and invoke it only from the relevant state tick.
- Merge only lifecycle plumbing, not unique gameplay logic.

## Step-By-Step Migration Procedure

1. Rename entrypoints and tags.
- Convert data/minecraft/tags/function/load.json to call <game>:_load.
- Delete data/minecraft/tags/function/tick.json.
- Create _load.mcfunction if only load.mcfunction existed.

2. Extract orchestration out of old tick loop.
- Remove game.id GLOBAL checks and lifecycle init guards.
- Move only game-internal phase dispatch into _tick.mcfunction.
- Create on/gametick.mcfunction that simply calls function <game>:_tick.

3. Build callback surface.
- Implement all required callback files in on/ and on/player/.
- Put one-time game-start setup in on/gamestart.
- Put intro map prewarm/setup in on/introstart.
- Put join/rejoin/death behavior into on/player/* callbacks.

4. Rewrite _load for MAIN-driven intro/outro.
- Keep objective declarations.
- Add data modify storage main:intro <game>.* entries:
  - camera_starting_coords
  - player_starting_coords
  - howtoplay (slides of exactly 6 rows each)
- Add data modify storage main:outro <game>.stats entries for leaderboard slides.

5. Remove old lifecycle states.
- Delete or stop referencing old lobby and postgame states.
- Keep only states relevant during MAIN superstate 3 gameplay.

6. Replace game-end handoff.
- Remove exit.mcfunction handoff that sets game.id GLOBAL.
- In final win-condition branch, call function main:api/end_game.

7. Normalize rejoin and late-join policy.
- In on/player/rejoin, restore safe spectator or active mode as appropriate.
- In on/player/latejoin, enforce spectator for mid-game joins unless game rules allow joining.

8. Keep advancements but add game-active guards.
- In each reward function, verify active phase before awarding gameplay effects.
- Revoke repeatable advancements where needed.

## AI Agent Rules During Migration

1. Never modify MAIN datapack files.
2. Never register tick.json in the migrated minigame pack.
3. Never keep or introduce game.id GLOBAL gating in active tick flow.
4. Never keep or introduce next-game-id chaining logic.
5. Always provide complete on/* callback files even if some are initially minimal.
6. Always configure main:intro and main:outro in _load.
7. Always terminate gameplay using function main:api/end_game.

## Suggested Migration Checklist

- load tag points to _load
- no tick tag exists
- _load creates all required objectives and intro/outro storage data
- on/introstart exists and runs safely
- on/gamestart exists and starts first gameplay phase
- on/gametick exists and calls internal dispatcher
- on/player/death exists and is phase-guarded
- on/player/latejoin exists
- on/player/rejoin exists
- duplicated states/*/join files have been consolidated to on/player/rejoin (or temporary wrappers)
- duplicated states/*/while_dead and states/*/respawn plumbing have been consolidated
- no references remain to game.id GLOBAL
- no references remain to GLOBAL.player_in_state
- no references remain to old exit flow that sets next game id
- end condition calls main:api/end_game

## Recommended Validation Commands

Use these searches after migration:

1. Find forbidden old control patterns.
- Search for game.id GLOBAL
- Search for GLOBAL.player_in_state
- Search for GLOBAL.player_left
- Search for GLOBAL.time_alive

2. Verify callback endpoints exist.
- Confirm all files under data/<game>/function/on/... listed above

3. Verify MAIN integration data is present.
- Search for data modify storage main:intro <game>.
- Search for data modify storage main:outro <game>.stats

4. Verify end-of-game API call exists.
- Search for function main:api/end_game

5. Verify no tick registration remains.
- Ensure data/minecraft/tags/function/tick.json is absent in the migrated pack

## Common Pitfalls

- Keeping stale README claims about legacy wrappers after wrappers are removed.
- Migrating file names but forgetting to delete tick.json.
- Moving state ticks but forgetting to create on/gametick.
- Keeping postgame timers that fight MAIN outro timing.
- Forgetting phase guards in death/advancement callbacks.

## Notes About the Spleef Example

- The old pack explicitly owned lobby and postgame lifecycle: [old-spleef-tag/data/spleef/function/states/lobby/start.mcfunction](old-spleef-tag/data/spleef/function/states/lobby/start.mcfunction#L1), [old-spleef-tag/data/spleef/function/states/postgame/start.mcfunction](old-spleef-tag/data/spleef/function/states/postgame/start.mcfunction#L1)
- The new pack keeps only gameplay-relevant phases and ends through MAIN: [spleef-tag/data/spleef/function/states/ingame_freeze/tick.mcfunction](spleef-tag/data/spleef/function/states/ingame_freeze/tick.mcfunction#L36)
