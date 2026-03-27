# ============================================================
# exact:on/gamestart
# Called by: main:private/call/gamestart
# Executor:  Server
# ============================================================

scoreboard players reset @a exact.stats.completed
scoreboard players reset @a exact.stats.deaths
tag @a remove exact.done

bossbar set exact:timer visible true
bossbar set exact:timer players @a

# Begin the game's internal pregame countdown.
function exact:states/pregame/start
