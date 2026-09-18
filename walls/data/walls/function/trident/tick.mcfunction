# ============================================================
# walls:trident/tick
# Called by: walls:_tick
# Executor:  Server
#
# The Trickster's Volatile Trident is the only source of tridents
# in this game, so any trident that sticks into the ground is one
# of them — no NBT sniffing needed.
# ============================================================

execute as @e[type=trident,nbt={inGround:1b}] at @s run function walls:trident/boom
