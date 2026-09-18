# ============================================================
# exact:adv/8
# Reward handler for task 8: Arson
# Trigger: minecraft:item_used_on_block
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:8
execute unless score ?task exact.state matches 8 run return run advancement revoke @s only exact:8

function exact:state/ingame_task/win
