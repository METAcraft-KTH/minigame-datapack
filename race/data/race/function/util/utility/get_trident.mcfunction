# ============================================================
# race:util/utility/get_trident
# Called by: Crossing trident marker or spawn egg
# Executor:  Player
# ============================================================
# Give player a Riptide trident.

give @s minecraft:trident[enchantments={riptide:3}]
playsound minecraft:item.trident.throw master @s ~ ~ ~ 1.0 1.0
