REPLACE ALL occurrences of `gamename` with your minigame's namespace.

This template now includes a complete 3-round state machine:

1. Ready phase (15 seconds, actionbar countdown)
2. Gameplay phase (2 minutes, actionbar countdown)
3. Break phase (30 seconds, actionbar countdown)

At break end:

- If round is 1 or 2, it starts the next gameplay round.
- If round is 3, it calls `main:api/end_game`.

Included examples:

- Sample advancement triggers in `data/gamename/advancement/`
- Reward handlers in `data/gamename/function/events/`
- Phase logic in `data/gamename/function/state/{ready,play,break}/`

Primary scoreboard fake players used by the state machine:

- `?phase` in `gamename.state`
- `?round` in `gamename.state`
- `?phase_timer` in `gamename.timer`
- `?match_timer` in `gamename.timer`