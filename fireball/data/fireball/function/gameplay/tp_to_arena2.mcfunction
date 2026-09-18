
$execute in $(arena_dimension) run spreadplayers $(red_spawn_x) $(red_spawn_z) 3 3 under $(red_spawn_y) false @a[team=fireball.red]
$execute in $(arena_dimension) run spreadplayers $(black_spawn_x) $(black_spawn_z) 3 3 under $(black_spawn_y) false @a[team=fireball.black]

execute as @a[team=fireball.black] run rotate @s 0.0 0.0
execute as @a[team=fireball.red] run rotate @s 180.0 0.0

