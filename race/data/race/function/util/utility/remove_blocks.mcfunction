# ============================================================
# race:util/utility/remove_blocks
# Called by: Crossing remove blocks marker or spawn egg
# Executor:  Player
# ============================================================
# Remove player's building blocks.

clear @s minecraft:pink_wool
clear @s shears
playsound minecraft:block.wood.break master @s ~ ~ ~ 1.0 1.0
