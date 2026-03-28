# ============================================================
# race:util/utility/get_elytra
# Called by: Crossing elytra marker or spawn egg
# Executor:  Player
# ============================================================
# Give player an elytra.

give @s minecraft:elytra{Unbreakable:1b,display:{Name:'{"text":"Race Elytra","italic":false,"color":"aqua"}'}}
playsound minecraft:item.armor.equip_elytra master @s ~ ~ ~ 1.0 1.0
