# ============================================================
# exact:adv/8
# Advancement reward handler for round 8
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:8
execute unless score ?round exact.state matches 8 run return run advancement revoke @s only exact:8

function exact:state/ingame_task/win
