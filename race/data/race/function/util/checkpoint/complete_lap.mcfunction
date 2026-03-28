# ============================================================
# race:util/checkpoint/complete_lap
# Called by: race:util/checkpoint/advance_checkpoint
# Executor:  Player (tag=race.playing)
# ============================================================
# Handle lap completion.

# Increment lap counter
scoreboard players add @s race.lap 1
scoreboard players set @s race.checkpoint 0

# Check if finished (3 laps)
execute if score @s race.lap matches 3 run function race:util/checkpoint/finish_race

# Notify player
title @s title [{"text":"Lap ","color":"green"},{"score":{"name":"@s","objective":"race.lap"},"color":"gold"},{"text":" Complete!","color":"green"}]
playsound minecraft:block.bell.use master @s ~ ~ ~ 1.0 1.0
