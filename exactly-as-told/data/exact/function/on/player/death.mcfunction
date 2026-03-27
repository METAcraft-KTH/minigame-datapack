# ============================================================
# exact:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
# Preconditions: superstate == 3
# ============================================================

execute if entity @s[tag=admin] run return 0
scoreboard players add @s exact.stats.deaths 1

# Reuse existing per-state death hooks.
execute if score ?state exact.game = state.pregame exact.config run function exact:states/pregame/while_dead
execute if score ?state exact.game = state.ingame_run exact.config run function exact:states/ingame_run/while_dead
execute if score ?state exact.game = state.ingame_pause exact.config run function exact:states/ingame_pause/while_dead
execute if score ?state exact.game = state.postgame exact.config run function exact:states/postgame/while_dead
