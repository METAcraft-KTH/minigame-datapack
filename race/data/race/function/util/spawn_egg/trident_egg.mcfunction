# ============================================================
# race:util/spawn_egg/trident_egg
# Called by: Admin command or setup function
# Executor:  Player (receives item)
# ============================================================
# Give player a custom item to mark trident utility stations.

give @s minecraft:zombie_spawn_egg{CustomModelData:7,display:{Name:'{"text":"Trident Utility Marker","italic":false,"color":"dark_aqua","bold":true}',Lore:['{"text":"Right-click at utility locations","color":"gray"}','{"text":"Then run: /function race:util/checkpoint/create_trident_station","color":"gray"}']}}
tellraw @s {"text":"Trident Utility Marker given. See item for instructions.","color":"dark_aqua"}
