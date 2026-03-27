# ============================================================
# spleef:_tick
# Called by: spleef:on/gametick
# Executor:  Server
#
# Internal state dispatcher for the active minigame.
# ============================================================

execute unless score ?state spleef.game matches -2147483648..2147483647 run function spleef:states/pregame/start

execute if score ?state spleef.game = state.pregame spleef.config run function spleef:states/pregame/tick
execute if score ?state spleef.game = state.ingame_spleef spleef.config run function spleef:states/ingame_spleef/tick
execute if score ?state spleef.game = state.ingame_run spleef.config run function spleef:states/ingame_run/tick
execute if score ?state spleef.game = state.ingame_freeze spleef.config run function spleef:states/ingame_freeze/tick

function spleef:utility/tick
function spleef:universal/tick