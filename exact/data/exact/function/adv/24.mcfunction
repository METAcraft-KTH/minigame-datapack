# ============================================================
# exact:adv/24
# Reward handler for task 24: Touch grass (speed course)
# Trigger: granted by exact:state/ingame_task/tick
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:24
execute unless score ?task exact.state matches 24 run return run advancement revoke @s only exact:24

function exact:state/ingame_task/win
