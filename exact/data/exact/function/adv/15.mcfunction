# ============================================================
# exact:adv/15
# Reward handler for task 15: Buy anything
# Trigger: minecraft:villager_trade
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:15
execute unless score ?task exact.state matches 15 run return run advancement revoke @s only exact:15

function exact:state/ingame_task/win
