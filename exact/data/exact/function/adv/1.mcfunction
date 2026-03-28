# ============================================================
# exact:adv/1
# Advancement reward handler for round 1
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:1
execute unless score ?round exact.state matches 1 run return run advancement revoke @s only exact:1

function exact:state/ingame_task/win
