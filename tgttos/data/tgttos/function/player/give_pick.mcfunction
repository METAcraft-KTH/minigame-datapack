# ============================================================
# tgttos:player/give_pick
# Called by: tgttos:player/setup, tgttos:util/second
# Executor:  The player to hand a pickaxe to
#
# Everyone plays in adventure mode, so what a tool may break is
# spelled out on the tool. Wool (the control point floors) and
# both teams' concrete (bridges) — nothing else. That is what
# keeps the beacons, the glass and the spawn platforms standing.
# ============================================================

give @s minecraft:diamond_pickaxe[minecraft:enchantments={efficiency:3,sharpness:5},minecraft:unbreakable={},minecraft:can_break={predicates:[{blocks:"#minecraft:wool"},{blocks:["minecraft:pink_concrete","minecraft:light_blue_concrete"]}]},minecraft:tooltip_display={hidden_components:["can_break","unbreakable","enchantments"]}]
