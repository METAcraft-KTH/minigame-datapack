# ============================================================
# race:util/utility/get_blocks
# Called by: Crossing blocks marker or spawn egg
# Executor:  Player
# ============================================================
# Give player building blocks (64 pink wool blocks).

give @s minecraft:pink_wool[can_place_on={blocks:["gold_block","pink_wool"]}] 64
give @s shears[can_break={blocks:["pink_wool"]}] 1
playsound minecraft:block.wood.place master @s ~ ~ ~ 1.0 1.0
