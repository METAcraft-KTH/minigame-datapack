# ============================================================
# exact:adv/6
# Reward handler for task 6: Enchant pickaxe
# Trigger: minecraft:enchanted_item
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:6
execute unless score ?task exact.state matches 6 run return run advancement revoke @s only exact:6

function exact:state/ingame_task/win
