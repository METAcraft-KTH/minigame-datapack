execute as @n[tag=tf.border,type=marker] at @s run tp ~1 ~ ~

execute at @n[tag=tf.border,type=marker] run fill ~ 64 60019 ~ 64 59970 red_terracotta replace blue_terracotta
execute at @n[tag=tf.border,type=marker] run fill ~ 87 60019 ~ 65 59970 red_wool replace blue_wool

execute at @n[tag=tf.border,type=marker] run fill ~ 65 59969 ~ 67 59969 mud_bricks replace stone_bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 68 59969 ~ 87 59969 polished_granite replace polished_andesite
execute at @n[tag=tf.border,type=marker] run fill ~ 68 59969 ~ 87 59969 granite replace andesite
execute at @n[tag=tf.border,type=marker] run fill ~ 68 59969 ~ 87 59969 terracotta replace stone
execute at @n[tag=tf.border,type=marker] run fill ~ 68 59969 ~ 87 59969 bricks replace gravel
execute at @n[tag=tf.border,type=marker] run fill ~ 88 59969 ~ 90 59969 packed_mud replace chiseled_stone_bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 91 59969 ~ 91 59969 mud_brick_wall replace stone_brick_wall
execute at @n[tag=tf.border,type=marker] run fill ~ 92 59969 ~ 93 59969 waxed_copper_bars replace iron_bars


execute at @n[tag=tf.border,type=marker] run fill ~ 65 60020 ~ 67 60020 mud_bricks replace stone_bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 68 60020 ~ 87 60020 polished_granite replace polished_andesite
execute at @n[tag=tf.border,type=marker] run fill ~ 68 60020 ~ 87 60020 granite replace andesite
execute at @n[tag=tf.border,type=marker] run fill ~ 68 60020 ~ 87 60020 terracotta replace stone
execute at @n[tag=tf.border,type=marker] run fill ~ 68 60020 ~ 87 60020 bricks replace gravel
execute at @n[tag=tf.border,type=marker] run fill ~ 88 60020 ~ 90 60020 packed_mud replace chiseled_stone_bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 91 60020 ~ 91 60020 mud_brick_wall replace stone_brick_wall
execute at @n[tag=tf.border,type=marker] run fill ~ 92 60020 ~ 93 60020 waxed_copper_bars replace iron_bars

scoreboard players add ?turf tf.state 1
give @a[team=tf.red] red_wool 2
give @a[team=tf.blue] blue_wool 2