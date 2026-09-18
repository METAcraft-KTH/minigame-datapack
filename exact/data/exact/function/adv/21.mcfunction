# ============================================================
# exact:adv/21
# Reward handler for task 21: Wololo
# Trigger: minecraft:player_interacted_with_entity
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:21
execute unless score ?task exact.state matches 21 run return run advancement revoke @s only exact:21

function exact:state/ingame_task/win
