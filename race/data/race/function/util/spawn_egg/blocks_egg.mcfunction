# ============================================================
# race:util/spawn_egg/blocks_egg
# Called by: Admin command or setup function
# Executor:  Player (receives item)
# ============================================================
# Give player a custom item to mark block utility stations.

give @s minecraft:zombie_spawn_egg{CustomModelData:5,display:{Name:'{"text":"Blocks Utility Marker","italic":false,"color":"brown","bold":true}',Lore:['{"text":"Right-click at utility locations","color":"gray"}','{"text":"Then run: /function race:util/checkpoint/create_blocks_station","color":"gray"}']}}
tellraw @s {"text":"Blocks Utility Marker given. See item for instructions.","color":"dark_red"}
