# ============================================================
# walls:econ/redeem_xp
# Called by: walls:player/tick
# Executor:  A player holding an XP token from the Miner
#
# The Miner cannot sell experience directly, so it sells a token
# that gets swapped for the XP on the tick it arrives.
# ============================================================

clear @s experience_bottle[custom_data~{walls_xp:1b}] 1
xp add @s 16 points
execute at @s run playsound entity.experience_orb.pickup master @s ~ ~ ~ 1 1
