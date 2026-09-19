# ============================================================
# tgttos:arrow/land
# Called by: tgttos:arrow/tick
# Executor:  An arrow that has just stuck into a block
#
# "Within 0.3 blocks of where it lands" is checked as the eight
# corners of a 0.6 cube around the arrow's own position, which
# is the block it stuck into plus any block it is touching the
# face of. Corners that land in the same block are free: the
# first one clears it and the rest fail the concrete check.
#
# The arrow is killed at the end regardless of whether it broke
# anything — no falling leftovers, and nothing to pick back up.
# ============================================================

execute positioned ~-0.3 ~-0.3 ~-0.3 if block ~ ~ ~ #tgttos:concrete run function tgttos:arrow/pop
execute positioned ~-0.3 ~-0.3 ~0.3 if block ~ ~ ~ #tgttos:concrete run function tgttos:arrow/pop
execute positioned ~-0.3 ~0.3 ~-0.3 if block ~ ~ ~ #tgttos:concrete run function tgttos:arrow/pop
execute positioned ~-0.3 ~0.3 ~0.3 if block ~ ~ ~ #tgttos:concrete run function tgttos:arrow/pop
execute positioned ~0.3 ~-0.3 ~-0.3 if block ~ ~ ~ #tgttos:concrete run function tgttos:arrow/pop
execute positioned ~0.3 ~-0.3 ~0.3 if block ~ ~ ~ #tgttos:concrete run function tgttos:arrow/pop
execute positioned ~0.3 ~0.3 ~-0.3 if block ~ ~ ~ #tgttos:concrete run function tgttos:arrow/pop
execute positioned ~0.3 ~0.3 ~0.3 if block ~ ~ ~ #tgttos:concrete run function tgttos:arrow/pop

kill @s
