# ============================================================
# race:util/spawn_egg/remove_elytra_egg
# Called by: Admin command or setup function
# Executor:  Player (receives item)
# ============================================================
# Give player a custom item to mark elytra removal stations.

give @s minecraft:zombie_spawn_egg{CustomModelData:4,display:{Name:'{"text":"Remove Elytra Marker","italic":false,"color":"red","bold":true}',Lore:['{"text":"Right-click at utility locations","color":"gray"}','{"text":"Then run: /function race:util/checkpoint/create_remove_elytra_station","color":"gray"}']}}
tellraw @s {"text":"Remove Elytra Marker given. See item for instructions.","color":"red"}
