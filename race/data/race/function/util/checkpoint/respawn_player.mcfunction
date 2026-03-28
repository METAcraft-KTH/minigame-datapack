# ============================================================
# race:util/checkpoint/respawn_player
# Called by: race:util/checkpoint/process_checkpoint
# Executor:  Player (tag=race.playing)
# ============================================================
# Reset player to respawn point if they skip checkpoints.

# Get the respawn marker associated with the expected checkpoint
# This assumes respawn markers are tagged and linked via data
execute store result score #respawn_id race.state run data get entity @e[type=minecraft:marker,tag=race.checkpoint,distance=..2,limit=1] data.respawn_id 1

# Teleport to respawn marker
execute at @e[type=minecraft:marker,tag=race.respawn,distance=..50,limit=1] if score #respawn_id race.state matches 0.. run tp @s ~ ~ ~

# Reset checkpoint to appropriate value
scoreboard players set @s race.checkpoint -1

# Notify player
title @s title {"text":"Checkpoint Skipped!","color":"red","bold":true}
title @s subtitle {"text":"Sent back to respawn.","color":"red"}
playsound minecraft:entity.enderman.teleport master @s ~ ~ ~ 1.0 0.5
