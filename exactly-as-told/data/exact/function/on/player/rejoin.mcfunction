# ============================================================
# exact:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Rejoining player
# ============================================================

execute if entity @s[tag=admin] run return 0
execute unless entity @s[tag=exact.registered] run function exact:register_new_player

# Reuse existing per-state join handlers.
execute if score ?state exact.game = state.pregame exact.config run function exact:states/pregame/join
execute if score ?state exact.game = state.ingame_run exact.config run function exact:states/ingame_run/join
execute if score ?state exact.game = state.ingame_pause exact.config run function exact:states/ingame_pause/join
execute if score ?state exact.game = state.postgame exact.config run function exact:states/postgame/join
