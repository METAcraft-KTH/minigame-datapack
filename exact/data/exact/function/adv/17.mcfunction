# ============================================================
# exact:adv/17
# Reward handler for task 17: Sit down
# Trigger: granted by exact:state/ingame_task/tick
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:17
execute unless score ?task exact.state matches 17 run return run advancement revoke @s only exact:17

function exact:state/ingame_task/win
