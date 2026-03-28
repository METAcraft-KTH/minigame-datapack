# exact - 16-Round Task Completion Minigame

A minigame where players have 20 seconds to complete a series of 16 different tasks. Each task is validated via an advancement trigger.

## Gameplay Flow

1. **Pregame** (15 seconds) — Players prepare
2. **Task Phase** (20 seconds per round) — Players must complete the task; successful completion shows "SUCCESS" title
3. **Wait Phase** (10 seconds) — Players who failed see "FAILURE"; win counts are updated
4. Repeat steps 2-3 for rounds 1-16
5. **End Game** — After round 16 completes

## Structure

- **Advancements**: 16 triggers named `exact:1` through `exact:16`, one per round
- **Advancement Handlers**: Functions in `data/exact/function/adv/` named `1.mcfunction` through `16.mcfunction`
  - Each handler checks if the current round matches its round number
  - If yes, awards the `exact.win` tag to the player
  - If no, does nothing (triggered at wrong time)

## Customization

Edit `data/exact/function/state/ingame_task/enter.mcfunction` to:
- Change task descriptions in the subtitle for each round
- Add round-specific logic in the placeholder sections

Edit advancement JSON files in `data/exact/advancement/` to use custom triggers for each task (replacing the `minecraft:impossible` placeholder with meaningful criteria like `minecraft:player_killed_entity`, `minecraft:consume_item`, etc.).

## Scoring

- Players earn 1 point for each round they complete successfully
- Final stats displayed in the outro leaderboard as "Rounds Completed: X / 16"

## Tags

- `exact.win` — Added to players who complete the current round; removed at the start of each wait phase
