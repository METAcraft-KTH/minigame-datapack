# ============================================================
# exact:adv/27
# Reward handler for task 27: Craft crossbow
# Trigger: minecraft:recipe_crafted
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:27
execute unless score ?task exact.state matches 27 run return run advancement revoke @s only exact:27

function exact:state/ingame_task/win
