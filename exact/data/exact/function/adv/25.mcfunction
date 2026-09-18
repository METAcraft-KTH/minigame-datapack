# ============================================================
# exact:adv/25
# Reward handler for task 25: Make bread
# Trigger: minecraft:inventory_changed
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:25
execute unless score ?task exact.state matches 25 run return run advancement revoke @s only exact:25

function exact:state/ingame_task/win
