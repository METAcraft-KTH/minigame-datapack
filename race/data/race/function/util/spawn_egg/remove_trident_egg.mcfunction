# ============================================================
# race:util/spawn_egg/remove_trident_egg
# Called by: Admin command or setup function
# Executor:  Player (receives item)
# ============================================================
# Give player a custom item to mark trident removal stations.

give @s minecraft:zombie_spawn_egg{CustomModelData:8,display:{Name:'{"text":"Remove Trident Marker","italic":false,"color":"dark_red","bold":true}',Lore:['{"text":"Right-click at utility locations","color":"gray"}','{"text":"Then run: /function race:util/checkpoint/create_remove_trident_station","color":"gray"}']}}
tellraw @s {"text":"Remove Trident Marker given. See item for instructions.","color":"dark_red"}
