# ============================================================
# exact:adv/11
# Reward handler for task 11: Blind yourself
# Trigger: minecraft:effects_changed
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:11
execute unless score ?task exact.state matches 11 run return run advancement revoke @s only exact:11

function exact:state/ingame_task/win
