# ============================================================
# exact:adv/5
# Advancement reward handler for round 5
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:5
execute unless score ?round exact.state matches 5 run return run advancement revoke @s only exact:5

title @s subtitle "Sneak 0 times!!"
function exact:state/ingame_task/win
