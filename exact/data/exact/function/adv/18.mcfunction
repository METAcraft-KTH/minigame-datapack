# ============================================================
# exact:adv/18
# Reward handler for task 18: Jump into the void
# Trigger: granted by exact:state/ingame_task/tick
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:18
execute unless score ?task exact.state matches 18 run return run advancement revoke @s only exact:18

function exact:state/ingame_task/win
