# ============================================================
# race:util/utility/lose_trident
# Called by: Crossing remove trident marker or spawn egg
# Executor:  Player
# ============================================================
# Remove player's trident.

clear @s minecraft:trident
playsound minecraft:item.trident.return master @s ~ ~ ~ 1.0 1.0
