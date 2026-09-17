# ============================================================
# exact:adv/2
# Advancement reward handler for task 2
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:2
execute unless score ?task exact.state matches 2 run return run advancement revoke @s only exact:2

function exact:state/ingame_task/win
