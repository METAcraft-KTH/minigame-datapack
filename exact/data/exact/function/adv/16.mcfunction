# ============================================================
# exact:adv/16
# Advancement reward handler for round 16
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:16
execute unless score ?round exact.state matches 16 run return run advancement revoke @s only exact:16

function exact:state/ingame_task/win