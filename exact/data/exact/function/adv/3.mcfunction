# ============================================================
# exact:adv/3
# Advancement reward handler for task 3
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:3
execute unless score ?task exact.state matches 3 run return run advancement revoke @s only exact:3

function exact:state/ingame_task/win
