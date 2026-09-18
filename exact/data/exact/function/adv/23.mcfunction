# ============================================================
# exact:adv/23
# Reward handler for task 23: Touch grass (riptide course)
# Trigger: granted by exact:state/ingame_task/tick
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:23
execute unless score ?task exact.state matches 23 run return run advancement revoke @s only exact:23

function exact:state/ingame_task/win
