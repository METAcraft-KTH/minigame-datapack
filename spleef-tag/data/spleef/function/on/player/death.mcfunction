# ============================================================
# spleef:on/player/death
# Called by: main:private/call/death
# Executor:  Player who died
# Preconditions: superstate == 3
# ============================================================

# Only award/elimination logic during active rounds.
execute unless score ?state spleef.game matches 21..23 run return 0

function spleef:states/ingame_spleef/respawn