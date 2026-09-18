# ============================================================
# exact:adv/1
# Reward handler for task 1: Jump 9 blocks high
# Trigger: minecraft:fall_after_explosion
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:1
execute unless score ?task exact.state matches 1 run return run advancement revoke @s only exact:1

function exact:state/ingame_task/win
