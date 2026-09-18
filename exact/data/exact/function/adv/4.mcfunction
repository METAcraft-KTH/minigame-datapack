# ============================================================
# exact:adv/4
# Reward handler for task 4: Drink milk
# Trigger: minecraft:consume_item
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:4
execute unless score ?task exact.state matches 4 run return run advancement revoke @s only exact:4

function exact:state/ingame_task/win
