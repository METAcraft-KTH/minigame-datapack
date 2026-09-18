# ============================================================
# exact:util/catchup_damage
# Called by: exact:util/catchup
# Executor:  Player who just (re)joined
# Macro args: hearts - health points to take (2 per missed round)
#
# out_of_world is the one damage type in #bypasses_resistance,
# so the resistance 5 everyone carries does not soak this up.
# ============================================================

$damage @s $(hearts) minecraft:out_of_world
