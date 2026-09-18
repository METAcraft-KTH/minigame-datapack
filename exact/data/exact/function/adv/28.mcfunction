# ============================================================
# exact:adv/28
# Reward handler for task 28: Craft end crystal
# Trigger: minecraft:recipe_crafted
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:28
execute unless score ?task exact.state matches 28 run return run advancement revoke @s only exact:28

function exact:state/ingame_task/win
