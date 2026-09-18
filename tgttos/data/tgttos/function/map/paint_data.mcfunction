# ============================================================
# tgttos:map/paint_data
# Called by: tgttos:cap/cap_data
# Executor:  Server, positioned on the control point's marker
#
# Recolours whatever wool is still standing — holes people shot
# in the floor stay holes — and the glass, which drags the beacon
# beam over to pink with it.
# ============================================================

fill ~-5 ~-1 ~-5 ~4 ~-1 ~4 minecraft:pink_wool replace #minecraft:wool
setblock ~ ~-1 ~ minecraft:pink_stained_glass
