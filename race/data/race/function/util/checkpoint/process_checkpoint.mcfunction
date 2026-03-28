# ============================================================
# race:util/checkpoint/process_checkpoint
# Called by: race:util/checkpoint/check_player
# Executor:  Player (at checkpoint location)
# ============================================================
# Handle checkpoint crossing logic.

# This function needs to determine which checkpoint we're at
# and handle accordingly. This is a placeholder that will be
# expanded with actual checkpoint-specific logic.

# Get the checkpoint number from the nearest marker
execute store result score #cp_id race.state run data get entity @e[type=minecraft:marker,tag=race.checkpoint,distance=..2,limit=1] data.checkpoint_id 1

# If this is the expected next checkpoint, advance player
execute if score @s race.checkpoint = #cp_id race.state run function race:util/checkpoint/advance_checkpoint

# If player is at the wrong checkpoint, respawn them
execute unless score @s race.checkpoint = #cp_id race.state if score #cp_id race.state matches 0.. run function race:util/checkpoint/respawn_player
