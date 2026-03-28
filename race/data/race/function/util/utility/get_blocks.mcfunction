# ============================================================
# race:util/utility/get_blocks
# Called by: Crossing blocks marker or spawn egg
# Executor:  Player
# ============================================================
# Give player building blocks (64 oak wood blocks).

give @s minecraft:oak_wood 64
playsound minecraft:block.wood.place master @s ~ ~ ~ 1.0 1.0
