# ============================================================
# tgttos:player/check_void
# Called by: tgttos:player/tick
# Executor:  A living player
#
# ### MAP CONFIG ### Y=20 is the floor of the match.
#
# Everything is built at Y=63/64 over open air, so falling means
# dying. This does not wait for the world's own void to do it:
# 64 down to 20 is under two seconds of falling, comfortably
# inside the five second window "execute on attacker" uses, so
# whoever shot the bridge out still gets the kill.
# ============================================================

execute store result score #y tgttos.temp run data get entity @s Pos[1]
execute if score #y tgttos.temp matches ..20 run kill @s
