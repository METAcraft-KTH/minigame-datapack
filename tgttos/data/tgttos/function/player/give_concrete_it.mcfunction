# ============================================================
# tgttos:player/give_concrete_it
# Called by: tgttos:player/setup, tgttos:util/second
# Executor:  An IT player
#
# An empty can_place_on compound is a block predicate with no
# fields, which matches every block — the adventure mode way of
# saying "place this anywhere". The stack is topped back up to
# 64 every tick by tgttos:player/tick.
# ============================================================

give @s minecraft:light_blue_concrete[minecraft:can_place_on={},minecraft:tooltip_display={hidden_components:["can_place_on"]}] 64
