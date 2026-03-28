# ============================================================
# race:util/checkpoint/finish_race
# Called by: race:util/checkpoint/complete_lap
# Executor:  Player (tag=race.playing, race.lap=3)
# ============================================================
# Mark player as finished.

tag @s add race.finished
scoreboard players set @s race.stats.lap 3

# Record finish time (in ticks)
execute store result score @s race.stats.time run scoreboard players get ?match_timer race.timer

# Increment finished counter
scoreboard players add #finished_count race.state 1

# Notify player
title @s title {"text":"Race Complete!","color":"gold","bold":true}
title @s subtitle [{"text":"You finished in ","color":"green"},{"score":{"name":"?match_timer","objective":"race.timer"},"color":"gold"},{"text":" ticks","color":"green"}]
playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1.0 1.0
