# ============================================================
# race:util/utility/get_elytra
# Called by: Crossing elytra marker or spawn egg
# Executor:  Player
# ============================================================
# Give player an elytra.

item replace entity @s armor.body with minecraft:elytra[unbreakable={}]
playsound minecraft:item.armor.equip_elytra master @s ~ ~ ~ 1.0 1.0
