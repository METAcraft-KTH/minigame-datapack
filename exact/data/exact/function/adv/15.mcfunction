# ============================================================
# exact:adv/15
# Advancement reward handler for round 15
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:15
execute unless score ?round exact.state matches 15 run return run advancement revoke @s only exact:15

function exact:state/ingame_task/win
