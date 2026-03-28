# ============================================================
# race:util/checkpoint/advance_checkpoint
# Called by: race:util/checkpoint/process_checkpoint
# Executor:  Player (tag=race.playing)
# ============================================================
# Move player to next checkpoint in sequence.

# Increment checkpoint counter
scoreboard players add @s race.checkpoint 1

# Check if we've completed a lap (assuming 10 checkpoints per lap)
# This value should be adjusted based on actual course layout
execute if score @s race.checkpoint matches 11 run function race:util/checkpoint/complete_lap

# Play sound effect
playsound minecraft:block.note_block.ding master @s ~ ~ ~ 1.0 1.2
