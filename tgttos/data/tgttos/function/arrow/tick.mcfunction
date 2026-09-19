# ============================================================
# tgttos:arrow/tick
# Called by: tgttos:_tick
# Executor:  Server
#
# Arrows are this game's demolition charge: an arrow that lands
# takes the concrete it landed in with it, which is how you cut a
# bridge you cannot reach or drop somebody off the middle of one.
#
# Every arrow is destroyed the tick it sticks into something, so
# one arrow can only ever take one bite out of the map — it can
# never break its own perch, fall, and keep eating on the way down.
# ============================================================

execute positioned 20000 64 60050 as @e[type=minecraft:arrow,nbt={inGround:1b},distance=..400] at @s run function tgttos:arrow/land
