# ============================================================
# tgttos:arrow/tick
# Called by: tgttos:_tick
# Executor:  Server
#
# Arrows are this game's demolition charge: an arrow that lands
# takes the wool it landed in with it, which is how you drop
# somebody off a control point or cut a bridge you cannot reach.
#
# Each arrow only ever fires once — tgttos.spent — so an arrow
# that breaks its own perch and falls does not keep eating the
# map on the way down.
# ============================================================

execute positioned 20000 64 60050 as @e[type=minecraft:arrow,tag=!tgttos.spent,nbt={inGround:1b},distance=..400] at @s run function tgttos:arrow/land
