# ============================================================
# exact:adv/22
# Reward handler for task 22: Drink water
# Trigger: minecraft:consume_item
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:22
execute unless score ?task exact.state matches 22 run return run advancement revoke @s only exact:22

function exact:state/ingame_task/win
