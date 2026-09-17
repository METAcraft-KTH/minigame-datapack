# ============================================================
# exact:adv/6
# Advancement reward handler for task 6
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:6
execute unless score ?task exact.state matches 6 run return run advancement revoke @s only exact:6

function exact:state/ingame_task/win
