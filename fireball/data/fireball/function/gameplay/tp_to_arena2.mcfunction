
$execute in $(arena_dimension) run spreadplayers $(red_spawn_x) $(red_spawn_z) 3 3 under $(red_spawn_y) false @a[team=main.data]
$execute in $(arena_dimension) run spreadplayers $(black_spawn_x) $(black_spawn_z) 3 3 under $(black_spawn_y) false @a[team=main.it]

execute as @a[team=main.it] run rotate @s 0.0 0.0
execute as @a[team=main.data] run rotate @s 180.0 0.0

# warn-off target-selector-no-dimension
execute at @n[tag=fireball.arena_center,type=marker] run spawnpoint @a[team=main.it]