# ============================================================
# race:util/spawn_egg/checkpoint_egg
# Called by: Admin command or setup function
# Executor:  Player (receives item)
# ============================================================
# Give player a custom item to mark checkpoints.

give @s minecraft:zombie_spawn_egg{CustomModelData:1,display:{Name:'{"text":"Checkpoint Marker","italic":false,"color":"aqua","bold":true}',Lore:['{"text":"Right-click at checkpoint locations","color":"gray"}','{"text":"Then run: /function race:util/checkpoint/create_checkpoint","color":"gray"}']}}
tellraw @s {"text":"Checkpoint Marker given. See item for instructions.","color":"aqua"}
