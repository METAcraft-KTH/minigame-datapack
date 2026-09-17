# ============================================================
# exact:adv/14
# Advancement reward handler for task 14
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:14
execute unless score ?task exact.state matches 14 run return run advancement revoke @s only exact:14

function exact:state/ingame_task/win
