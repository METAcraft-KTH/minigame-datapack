# ============================================================
# exact:adv/7
# Reward handler for task 7: Poke someone
# Trigger: minecraft:player_hurt_entity
#
# Guards: the trigger is armed all game, so ignore it unless
# this exact task is the one currently running.
# ============================================================

execute unless score ?phase exact.state matches 1 run return run advancement revoke @s only exact:7
execute unless score ?task exact.state matches 7 run return run advancement revoke @s only exact:7

function exact:state/ingame_task/win
