# exact - 15-Round Task Completion Minigame

A minigame where players have 20 seconds to complete a task. There are 30 tasks and 15 rounds, so every game plays a different random half of them. See `TASKS.md` for the full list and how each one is won.

The task order is **shuffled every game**: `exact:on/gamestart` fills `storage exact:tasks pool` with `[1..30]`, and `exact:util/draw_task` pops one random entry out of it at the start of each round into `?task exact.state`. Because the entry is removed, no task repeats within a game.

## Gameplay Flow

1. **Pregame** (15 seconds) — Players prepare
2. **Task Phase** (20 seconds per round) — Players must complete the task; successful completion shows "SUCCESS" title
3. **Wait Phase** (10 seconds) — Players who failed see "FAILURE"; win counts are updated
4. Repeat steps 2-3 for rounds 1-15
5. **End Game** — After round 15 completes

## Structure

- **Advancements**: 30 triggers named `exact:1` through `exact:30`, one per task. Tasks with no suitable vanilla trigger use `minecraft:impossible` and are granted from `ingame_task/tick.mcfunction`
- **Advancement Handlers**: Functions in `data/exact/function/adv/` named `1.mcfunction` through `30.mcfunction`
  - Each handler checks if the active task (`?task`, *not* the round number) matches its task number
  - If yes, awards the `exact.win` tag to the player
  - If no, does nothing (triggered at wrong time)

## Customization

Edit `data/exact/function/state/ingame_task/enter.mcfunction` to:
- Change task descriptions in the subtitle for each task
- Add task-specific logic in the placeholder sections

Task setup/cleanup is keyed on `?task exact.state` (which task is active). `?round exact.state` is only the 1-15 progress counter — don't key task logic on it, or shuffling breaks.

Edit advancement JSON files in `data/exact/advancement/` to use custom triggers for each task (replacing the `minecraft:impossible` placeholder with meaningful criteria like `minecraft:player_killed_entity`, `minecraft:consume_item`, etc.).

## Early Cutoff

`?cutoff exact.state` is the percentage of players allowed to finish a task before the round is cut short to 3 seconds remaining. It is set once per round by `exact:util/set_cutoff` and ramps down (90 → 50) as rounds go on, so later rounds punish slow players harder. Edit that one file to retune the ramp.

The check runs in `exact:state/ingame_task/check_cutoff`, called from `win.mcfunction` each time somebody finishes. It only ever shortens a round — if fewer than 3 seconds are left already, the timer is untouched.

## Scoring

- Players earn 1 point for each round they complete successfully
- Final stats displayed in the outro leaderboard as "Rounds Completed: X / 15"

## Tags

- `exact.win` — Added to players who complete the current round; removed at the start of each wait phase
