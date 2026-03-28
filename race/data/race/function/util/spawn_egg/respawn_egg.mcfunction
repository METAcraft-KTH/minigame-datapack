# ============================================================
# race:util/spawn_egg/respawn_egg
# Called by: Admin command or setup function
# Executor:  Player (receives item)
# ============================================================
# Give player a custom item to mark respawn points.

give @s minecraft:zombie_spawn_egg{CustomModelData:2,display:{Name:'{"text":"Respawn Marker","italic":false,"color":"yellow","bold":true}',Lore:['{"text":"Right-click at respawn locations","color":"gray"}','{"text":"Then run: /function race:util/checkpoint/create_respawn","color":"gray"}']}}
tellraw @s {"text":"Respawn Marker given. See item for instructions.","color":"yellow"}
