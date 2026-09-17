# ============================================================
# exact:util/draw_task
# Called by: exact:state/ingame_task/enter (once per round)
# Executor:  Server
#
# Pops one random entry out of "storage exact:tasks pool" and puts
# it in ?task exact.state. Because the entry is removed from the
# pool, every task is played exactly once per game, in a random
# order. The pool is filled in exact:on/gamestart.
# ============================================================

# Nothing left to draw: keep the previous task rather than erroring
execute unless data storage exact:tasks pool[0] run return 0

# "data get" on a list yields its length; "random value" needs a
# 0-based maximum, so subtract one
execute store result score #pool_max exact.state run data get storage exact:tasks pool
scoreboard players remove #pool_max exact.state 1
execute store result storage exact:tasks macro.max int 1 run scoreboard players get #pool_max exact.state

function exact:util/draw_task_roll with storage exact:tasks macro
