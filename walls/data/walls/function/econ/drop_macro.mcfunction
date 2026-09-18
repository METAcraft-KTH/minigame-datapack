# ============================================================
# walls:econ/drop_macro
# Called by: walls:econ/drop_at
# Executor:  Server
#
# Macro args: {x:29990,y:64,z:60001,n:5}
# ============================================================

$summon item $(x).5 $(y).5 $(z).5 {Item:{id:"minecraft:prismarine_crystals",count:$(n)}}
