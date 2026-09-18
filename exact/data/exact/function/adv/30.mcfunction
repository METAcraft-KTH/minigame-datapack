# ============================================================
# exact:adv/30
# Reward handler for task 30: Craft white harness
# Trigger: minecraft:recipe_crafted
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:30
execute unless score ?task exact.state matches 30 run return run advancement revoke @s only exact:30

function exact:state/ingame_task/win
