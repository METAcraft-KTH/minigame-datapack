# ============================================================
# exact:adv/2
# Reward handler for task 2: Break the shovel
# Trigger: minecraft:item_durability_changed
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:2
execute unless score ?task exact.state matches 2 run return run advancement revoke @s only exact:2

function exact:state/ingame_task/win
