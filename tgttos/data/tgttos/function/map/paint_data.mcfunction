# ============================================================
# tgttos:map/paint_data
# Called by: tgttos:cap/cap_data
# Executor:  Server, positioned on the control point's marker
#
# Recolours the 9x9 floor and the glass, which drags the beacon
# beam over to pink with it — visible from the far platform.
# ============================================================

fill ~-4 ~-1 ~-4 ~4 ~-1 ~4 minecraft:pink_wool replace #minecraft:wool
setblock ~ ~-1 ~ minecraft:pink_stained_glass
