# ============================================================
# exact:adv/14
# Reward handler for task 14: Fuck bees
# Trigger: minecraft:bee_nest_destroyed
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:14
execute unless score ?task exact.state matches 14 run return run advancement revoke @s only exact:14

function exact:state/ingame_task/win
