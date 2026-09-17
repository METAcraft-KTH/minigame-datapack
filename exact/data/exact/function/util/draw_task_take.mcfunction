# ============================================================
# exact:util/draw_task_take
# Called by: exact:util/draw_task_roll
# Macro args: index - pool index to take
# ============================================================

$execute store result score ?task exact.state run data get storage exact:tasks pool[$(index)]
$data remove storage exact:tasks pool[$(index)]
