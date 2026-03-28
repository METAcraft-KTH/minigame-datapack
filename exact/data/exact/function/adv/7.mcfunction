# ============================================================
# exact:adv/7
# Advancement reward handler for round 7
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:7
execute unless score ?round exact.state matches 7 run return run advancement revoke @s only exact:7

function exact:state/ingame_task/win
