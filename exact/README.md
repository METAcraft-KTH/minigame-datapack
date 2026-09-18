# exact - Task Completion Elimination Minigame

A minigame where players have 20 seconds to complete a task. There are 30 tasks and no fixed number of rounds: the game runs until only one team's players are left alive.

The task order is **shuffled every game**: `exact:on/gamestart` fills `storage exact:tasks pool` with `[1..30]`, and `exact:util/draw_task` pops one random entry out of it at the start of each round into `?task exact.state`. Because the entry is removed, no task repeats until all 30 have been played — at which point `exact:util/refill_pool` puts them all back, announces it in chat, and the shuffle starts over.

## Hearts and Elimination

Health **is** the life counter.

- `exact:util/init_player` sets `max_health` to `10` (5 hearts) and heals every player to full at game start.
- Failing a task costs 1 heart: `exact:state/ingame_wait/enter` runs `damage @s 2 minecraft:out_of_world` on everyone still in the game without the `exact.win` tag.
- The **first** player to finish a task gets `regeneration II` for 3 seconds in `exact:state/ingame_task/win`, which heals exactly 1 heart back and cannot overshoot the cap.
- Running out of hearts kills the player. MAIN reports that to `exact:on/player/death`, which tags them `exact.dead` and puts them in spectator for the rest of the game.

Nothing else is allowed to move a health bar:

- `exact:on/gametick` keeps `resistance 5` (a flat 100% reduction) on every non-admin player in **every** phase and **every** task, task 7 included.
- `natural_health_regeneration` is off (`exact:state/pregame/enter`, and MAIN's `reset_gamerules` default).
- `out_of_world` is the only vanilla damage type in `#minecraft:bypasses_resistance`, which is why the heart damage uses it.
- `exact:state/ingame_task/tick` teleports anyone who drops below y55 back to the arena, because the void deals `out_of_world` damage too and would otherwise eliminate players by scenery. Task 24 (off-arena course) is exempt.

`exact:state/end/finish` resets `max_health` and heals everyone back up before handing control to MAIN, so the next game in the lineup does not inherit a half-empty health bar. The resistance is handed out in 5-second slices rather than as an infinite effect for the same reason — it lapses by itself. If the game is ever force-ended without `end/finish` running (an admin winding the superstate back by hand, say), run `function main:util/reset_player` on the players to drop the 5-heart cap.

## Missed Rounds

`exact.lastround` holds the last round whose result was settled for that player. It is written in `exact:state/ingame_wait/enter` for everyone present, so logging out is not a way to dodge the elimination.

`exact:util/catchup` runs on rejoin and on late join, and charges 1 heart per round settled while the player was away. Logged out during round 3 (`exact.lastround` = 2), back during round 5 → 2 hearts on the spot, plus round 5 itself if they fail it.

Late joiners are enrolled at `exact.lastround` = 1, so they start on 5 hearts and immediately pay for every round already played. Turn up late enough and that puts you straight out.

## Gameplay Flow

1. **Pregame** (15 seconds) — Players prepare
2. **Task Phase** (20 seconds per round) — Players must complete the task; successful completion shows "SUCCESS" title
3. **Wait Phase** (6 seconds) — Players who failed see "FAILURE" and lose a heart; win counts are updated
4. `exact:state/end/check` decides whether the game is over. If not, back to step 2 with the next task.
5. **End Game** — one team (or one player) left standing, or everybody out on the same round

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

Task setup/cleanup is keyed on `?task exact.state` (which task is active). `?round exact.state` is only the progress counter — don't key task logic on it, or shuffling breaks.

Edit advancement JSON files in `data/exact/advancement/` to use custom triggers for each task (replacing the `minecraft:impossible` placeholder with meaningful criteria like `minecraft:player_killed_entity`, `minecraft:consume_item`, etc.).

## Early Cutoff

`?cutoff exact.state` is the percentage of players still alive who may finish a task before the round is cut short to 3 seconds remaining. It is set once per round by `exact:util/set_cutoff` and ramps down (90 → 50) as rounds go on, so later rounds punish slow players harder. Edit that one file to retune the ramp. This ramp is what keeps the elimination moving — without it two evenly matched players could trade tasks forever.

The check runs in `exact:state/ingame_task/check_cutoff`, called from `win.mcfunction` each time somebody finishes. It only ever shortens a round — if fewer than 3 seconds are left already, the timer is untouched. Eliminated players are left out of the count, or the threshold would become unreachable.

## Scoring

- Players earn 1 point for each round they complete successfully
- Final stats displayed in the outro leaderboard as "Rounds Completed"

## State

- `?round exact.state` — round counter, unbounded
- `?phase exact.state` — 0 pregame, 1 task, 2 wait
- `?task exact.state` — the task being played this round
- `?had_data` / `?had_it exact.state` — whether each team had players at game start; the "team wiped out" end condition only applies to a team that actually turned up
- `#winner exact.state` — set by `exact:state/end/check`: -1 keep playing, 0 nobody, 1 Data, 2 IT

## Tags

- `exact.win` — Added to players who complete the current round; removed at the start of each task phase
- `exact.dead` — Eliminated. Spectates for the rest of the game, is skipped by round setup, the heart damage, the cutoff count and the points count
