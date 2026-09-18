# ============================================================
# exact:adv/29
# Reward handler for task 29: Craft rabbit stew
# Trigger: minecraft:inventory_changed
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:29
execute unless score ?task exact.state matches 29 run return run advancement revoke @s only exact:29

function exact:state/ingame_task/win
