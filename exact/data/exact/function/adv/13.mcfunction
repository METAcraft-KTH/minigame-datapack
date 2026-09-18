# ============================================================
# exact:adv/13
# Reward handler for task 13: Get breeding
# Trigger: minecraft:bred_animals
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:13
execute unless score ?task exact.state matches 13 run return run advancement revoke @s only exact:13

function exact:state/ingame_task/win
