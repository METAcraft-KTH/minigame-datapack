# ============================================================
# exact:adv/12
# Reward handler for task 12: Get hit by arrow
# Trigger: minecraft:player_killed_entity
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:12
execute unless score ?task exact.state matches 12 run return run advancement revoke @s only exact:12

function exact:state/ingame_task/win
