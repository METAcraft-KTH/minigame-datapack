# ============================================================
# exact:adv/3
# Reward handler for task 3: Avenge Jack Black
# Trigger: minecraft:player_killed_entity
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:3
execute unless score ?task exact.state matches 3 run return run advancement revoke @s only exact:3

function exact:state/ingame_task/win
