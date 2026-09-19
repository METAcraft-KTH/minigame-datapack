# ============================================================
# tgttos:map/build_point
# Called by: tgttos:map/setup
# Executor:  Server, positioned on the control point's anchor
#
# Macro args: {n:"1"}  — which point this is, for the marker tag.
#
# Builds one control point back to its neutral state:
#
#   marker  ~0.5 ~ ~0.5 the capture centre, 5 block radius. The
#                       half block offset puts it in the MIDDLE of
#                       the beacon's column instead of on its corner,
#                       so the radius and the 9x9 share a centre
#   glass   ~ ~-1 ~     white, and the beacon beam takes its colour
#   wool    ~ ~-1 ~     9x9 around the glass — odd, so the beam
#                       comes up through the exact middle block
#   air     ~ ~-4..-2 ~ kept clear so the beam reaches the glass
#   beacon  ~ ~-5 ~     4 blocks below the glass, a landmark you can
#                       see from spawn
#   iron    ~ ~-6 ~     3x3 pyramid base, so the beacon actually lights
#
# The floor is wool, which nothing in this game can break — only
# concrete comes down. The island is what it is for the whole match.
# ============================================================

$summon minecraft:marker ~0.5 ~ ~0.5 {Tags:["tgttos.point","tgttos.p$(n)"]}

fill ~-1 ~-6 ~-1 ~1 ~-6 ~1 minecraft:iron_block
setblock ~ ~-5 ~ minecraft:beacon
fill ~-1 ~-4 ~-1 ~1 ~-2 ~1 minecraft:air
fill ~-4 ~-1 ~-4 ~4 ~-1 ~4 minecraft:white_wool
setblock ~ ~-1 ~ minecraft:white_stained_glass
