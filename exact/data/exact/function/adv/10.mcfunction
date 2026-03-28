# ============================================================
# exact:adv/10
# Advancement reward handler for round 10
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:10
execute unless score ?round exact.state matches 10 run return run advancement revoke @s only exact:10

function exact:state/ingame_task/win
