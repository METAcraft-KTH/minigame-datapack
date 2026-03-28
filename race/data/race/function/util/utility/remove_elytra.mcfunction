# ============================================================
# race:util/utility/remove_elytra
# Called by: Crossing remove elytra marker or spawn egg
# Executor:  Player
# ============================================================
# Remove player's elytra.

clear @s minecraft:elytra
playsound minecraft:item.armor.unequip_elytra master @s ~ ~ ~ 1.0 1.0
