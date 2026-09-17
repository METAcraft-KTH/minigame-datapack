# ============================================================
# exact:adv/11
# Advancement reward handler for task 11
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:11
execute unless score ?task exact.state matches 11 run return run advancement revoke @s only exact:11

function exact:state/ingame_task/win
