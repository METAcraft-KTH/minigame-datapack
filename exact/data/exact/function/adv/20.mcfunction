# ============================================================
# exact:adv/20
# Reward handler for task 20: Hog rider
# Trigger: granted by exact:state/ingame_task/tick
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:20
execute unless score ?task exact.state matches 20 run return run advancement revoke @s only exact:20

function exact:state/ingame_task/win
