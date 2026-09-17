# ============================================================
# exact:util/draw_task_roll
# Called by: exact:util/draw_task
# Macro args: max - highest valid pool index
#
# "random value" needs literal bounds, so the roll gets its own
# macro function; the rolled index needs another one to be used.
# ============================================================

$execute store result storage exact:tasks macro.index int 1 run random value 0..$(max)

function exact:util/draw_task_take with storage exact:tasks macro
