# ============================================================
# exact:adv/5
# Reward handler for task 5: Sneak 67 times
# Trigger: granted by exact:state/ingame_task/tick
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:5
execute unless score ?task exact.state matches 5 run return run advancement revoke @s only exact:5

title @s subtitle "Sneak 0 times!!"
function exact:state/ingame_task/win
