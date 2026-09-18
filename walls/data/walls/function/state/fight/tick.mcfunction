# ============================================================
# walls:state/fight/tick
# Called by: walls:_tick
# Executor:  Server
#
# Phase 2. The win check itself lives in walls:golem/tick.
# ============================================================

# 20 minutes in, the defending golems start taking poison so the game
# cannot stall
execute if score ?match_timer walls.timer matches 24000 run function walls:golem/sudden_death

# Backstop: poison cannot finish a golem off, so a match where both
# sides refuse to push would run forever. At 30 minutes the side with
# the healthier golems takes it. Delete these two lines for a pure
# "last golems standing" game.
execute if score ?match_timer walls.timer matches 36000 run function walls:end/timeout
