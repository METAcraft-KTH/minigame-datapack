# ============================================================
# exact:adv/26
# Reward handler for task 26: Craft blast furnace
# Trigger: minecraft:recipe_crafted
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:26
execute unless score ?task exact.state matches 26 run return run advancement revoke @s only exact:26

function exact:state/ingame_task/win
