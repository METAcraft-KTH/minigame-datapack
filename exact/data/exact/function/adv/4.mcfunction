# ============================================================
# exact:adv/4
# Advancement reward handler for task 4
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:4
execute unless score ?task exact.state matches 4 run return run advancement revoke @s only exact:4

function exact:state/ingame_task/win
