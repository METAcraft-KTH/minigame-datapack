# ============================================================
# race:util/checkpoint/check_player
# Called by: race:util/checkpoint/monitor_all
# Executor:  Player (tag=race.playing, tag!=race.finished)
# ============================================================
# Check if current player is at any checkpoint.

# Check if player is near checkpoint marker (within 2 blocks)
execute at @e[type=minecraft:marker,tag=race.checkpoint,distance=..2,limit=1] run function race:util/checkpoint/process_checkpoint
