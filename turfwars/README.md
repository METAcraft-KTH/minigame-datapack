REPLACE ALL occurrences of `tf` with your minigame's namespace.

This template now includes a complete 3-round state machine:

1. Ready phase (15 seconds, actionbar countdown)
2. Gameplay phase (2 minutes, actionbar countdown)
3. Break phase (30 seconds, actionbar countdown)

At break end:

- If round is 1 or 2, it starts the next gameplay round.
- If round is 3, it calls `main:api/end_game`.

Included examples:

- Sample advancement triggers in `data/tf/advancement/`
- Reward handlers in `data/tf/function/events/`
- Phase logic in `data/tf/function/state/{ready,play,break}/`

Primary scoreboard fake players used by the state machine:

- `?phase` in `tf.state`
- `?round` in `tf.state`
- `?phase_timer` in `tf.timer`
- `?match_timer` in `tf.timer`