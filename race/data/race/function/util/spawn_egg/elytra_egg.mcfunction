# ============================================================
# race:util/spawn_egg/elytra_egg
# Called by: Admin command or setup function
# Executor:  Player (receives item)
# ============================================================
# Give player a custom item to mark elytra utility stations.

give @s minecraft:zombie_spawn_egg{CustomModelData:3,display:{Name:'{"text":"Elytra Utility Marker","italic":false,"color":"light_purple","bold":true}',Lore:['{"text":"Right-click at utility locations","color":"gray"}','{"text":"Then run: /function race:util/checkpoint/create_elytra_station","color":"gray"}']}}
tellraw @s {"text":"Elytra Utility Marker given. See item for instructions.","color":"light_purple"}
