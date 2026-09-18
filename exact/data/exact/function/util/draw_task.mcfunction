# ============================================================
# exact:util/draw_task
# Called by: exact:state/ingame_task/enter (once per round)
# Executor:  Server
#
# Pops one random entry out of "storage exact:tasks pool" and puts
# it in ?task exact.state. Because the entry is removed from the
# pool, no task repeats until all 30 have been played, in a random
# order. The pool is filled in exact:on/gamestart.
# ============================================================

# All 30 played: put them all back and keep going. The elimination
# decides when the game ends, not the length of the task list.
execute unless data storage exact:tasks pool[0] run function exact:util/refill_pool

# "data get" on a list yields its length; "random value" needs a
# 0-based maximum, so subtract one
execute store result score #pool_max exact.state run data get storage exact:tasks pool
scoreboard players remove #pool_max exact.state 1
execute store result storage exact:tasks macro.max int 1 run scoreboard players get #pool_max exact.state

function exact:util/draw_task_roll with storage exact:tasks macro
