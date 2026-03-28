# ============================================================
# race:util/utility/get_trident
# Called by: Crossing trident marker or spawn egg
# Executor:  Player
# ============================================================
# Give player a Riptide trident.

give @s minecraft:trident{Enchantments:[{id:"minecraft:riptide",lvl:1s}],Unbreakable:1b,display:{Name:'{"text":"Riptide Trident","italic":false,"color":"aqua"}'}}
playsound minecraft:item.trident.throw master @s ~ ~ ~ 1.0 1.0
