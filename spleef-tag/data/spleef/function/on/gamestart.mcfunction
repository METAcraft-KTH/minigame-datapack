# ============================================================
# spleef:on/gamestart
# Called by: main:private/call/gamestart
# Executor:  Server
# ============================================================

# Clear per-game stats and arm repeatable advancement trigger.
scoreboard players reset @a spleef.stats.rounds

# Start at pregame phase; this handles teleport, setup, and countdown.
function spleef:states/pregame/start