# ============================================================
# tgttos:player/give_pick
# Called by: tgttos:player/setup, tgttos:util/second
# Executor:  The player to hand a pickaxe to
#
# Everyone plays in adventure mode, so what a tool may break is
# spelled out on the tool. Both teams' concrete and nothing else
# — the same list the arrows work off. That is what keeps the
# beacons, the glass, the point floors and the spawn platforms
# standing no matter what anyone does to them.
# ============================================================

give @s minecraft:diamond_pickaxe[minecraft:enchantments={efficiency:4,sharpness:5},minecraft:unbreakable={},minecraft:can_break={blocks:"#tgttos:concrete"},minecraft:tooltip_display={hidden_components:["can_break","unbreakable","enchantments"]}]
