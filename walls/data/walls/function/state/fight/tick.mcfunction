# ============================================================
# walls:state/fight/tick
# Called by: walls:_tick
# Executor:  Server
#
# Phase 2. The win check itself lives in walls:tower/tick.
# ============================================================

# 20 minutes in, the towers start taking poison so the game
# cannot stall
execute if score ?match_timer walls.timer matches 24000 run function walls:tower/sudden_death

# Backstop: poison cannot finish a ravager off, so a match where both
# sides refuse to push would run forever. At 30 minutes the side with
# the healthier ravagers takes it. Delete these two lines for a pure
# "last ravagers standing" game.
execute if score ?match_timer walls.timer matches 36000 run function walls:end/timeout
