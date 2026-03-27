# ============================================================
# exact:_tick
# Called by: exact:on/gametick
# Executor:  Server
#
# Internal state dispatcher for the active minigame.
# ============================================================

execute unless score ?state exact.game matches -2147483648..2147483647 run function exact:states/pregame/start

# Detect death/respawn transitions for existing while_dead/respawn hooks.
execute as @a[scores={GLOBAL.time_alive=0},tag=!GLOBAL.is_dead] run tag @s add GLOBAL.is_dead
execute as @a[scores={GLOBAL.time_alive=1..},tag=GLOBAL.is_dead] run tag @s remove GLOBAL.is_dead

execute if score ?state exact.game = state.pregame exact.config run function exact:states/pregame/tick
execute if score ?state exact.game = state.ingame_run exact.config run function exact:states/ingame_run/tick
execute if score ?state exact.game = state.ingame_pause exact.config run function exact:states/ingame_pause/tick
execute if score ?state exact.game = state.postgame exact.config run function exact:states/postgame/tick

bossbar set exact:timer visible true
bossbar set exact:timer players @a

function exact:utility/tick
function exact:universal/tick
