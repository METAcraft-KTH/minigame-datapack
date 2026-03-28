# ============================================================
# exact:adv/9
# Advancement reward handler for round 9
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:9
execute unless score ?round exact.state matches 9 run return run advancement revoke @s only exact:9

function exact:state/ingame_task/win
