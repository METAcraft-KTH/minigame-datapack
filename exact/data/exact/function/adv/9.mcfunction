# ============================================================
# exact:adv/9
# Reward handler for task 9: Light a TNT block
# Trigger: minecraft:item_used_on_block
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:9
execute unless score ?task exact.state matches 9 run return run advancement revoke @s only exact:9

function exact:state/ingame_task/win
