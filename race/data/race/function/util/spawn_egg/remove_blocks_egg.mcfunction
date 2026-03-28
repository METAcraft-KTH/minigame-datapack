# ============================================================
# race:util/spawn_egg/remove_blocks_egg
# Called by: Admin command or setup function
# Executor:  Player (receives item)
# ============================================================
# Give player a custom item to mark block removal stations.

give @s minecraft:zombie_spawn_egg{CustomModelData:6,display:{Name:'{"text":"Remove Blocks Marker","italic":false,"color":"dark_gray","bold":true}',Lore:['{"text":"Right-click at utility locations","color":"gray"}','{"text":"Then run: /function race:util/checkpoint/create_remove_blocks_station","color":"gray"}']}}
tellraw @s {"text":"Remove Blocks Marker given. See item for instructions.","color":"dark_gray"}
