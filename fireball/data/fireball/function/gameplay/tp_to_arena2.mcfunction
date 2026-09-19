# ============================================================
# fireball:gameplay/tp_to_arena2
# Called by: fireball:gameplay/tp_to_arena (with storage fireball:config)
# Executor:  Server
#
# Data takes the red platform, IT takes the blackstone one.
# Yaw 0 is due south (+Z) and 180 due north (-Z); create_arena puts
# the red platform 30 blocks SOUTH of the centre and the black one
# 30 blocks north, so each team has to face back towards the middle.
# ============================================================

$execute in $(arena_dimension) run spreadplayers $(red_spawn_x) $(red_spawn_z) 3 3 under $(red_spawn_y) false @a[team=main.data]
$execute in $(arena_dimension) run spreadplayers $(black_spawn_x) $(black_spawn_z) 3 3 under $(black_spawn_y) false @a[team=main.it]

execute as @a[team=main.data] run rotate @s 180.0 0.0
execute as @a[team=main.it] run rotate @s 0.0 0.0
