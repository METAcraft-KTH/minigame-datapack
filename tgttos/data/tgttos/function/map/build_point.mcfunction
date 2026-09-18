# ============================================================
# tgttos:map/build_point
# Called by: tgttos:map/setup
# Executor:  Server, positioned on the control point's marker
#
# Macro args: {n:"1"}  — which point this is, for the marker tag.
#
# Builds one control point back to its neutral state:
#
#   marker  ~ ~   ~     the capture centre, 5 block radius
#   glass   ~ ~-1 ~     white, and the beacon beam takes its colour
#   wool    ~ ~-1 ~     10x10 around the glass — the island floor,
#                       and the only thing arrows can destroy
#   air     ~ ~-4..-2 ~ kept clear so the beam reaches the glass
#   beacon  ~ ~-5 ~     4 blocks below the glass, a landmark you can
#                       see from spawn
#   iron    ~ ~-6 ~     3x3 pyramid base, so the beacon actually lights
# ============================================================

$summon minecraft:marker ~ ~ ~ {Tags:["tgttos.point","tgttos.p$(n)"]}

fill ~-1 ~-6 ~-1 ~1 ~-6 ~1 minecraft:iron_block
setblock ~ ~-5 ~ minecraft:beacon
fill ~-1 ~-4 ~-1 ~1 ~-2 ~1 minecraft:air
fill ~-5 ~-1 ~-5 ~4 ~-1 ~4 minecraft:white_wool
setblock ~ ~-1 ~ minecraft:white_stained_glass
