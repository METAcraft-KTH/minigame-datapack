execute as @n[tag=tf.border,type=marker] at @s run tp ~1 ~ ~

execute at @n[tag=tf.border,type=marker] run fill ~ 64 60019 ~ 64 59970 blue_terracotta replace red_terracotta
execute at @n[tag=tf.border,type=marker] run fill ~ 87 60019 ~ 65 59970 blue_wool replace red_wool

execute at @n[tag=tf.border,type=marker] run fill ~ 65 59969 ~ 67 59969 stone_bricks replace mud_bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 68 59969 ~ 87 59969 polished_andesite replace polished_granite
execute at @n[tag=tf.border,type=marker] run fill ~ 68 59969 ~ 87 59969 andesite replace granite
execute at @n[tag=tf.border,type=marker] run fill ~ 68 59969 ~ 87 59969 stone replace terracotta
execute at @n[tag=tf.border,type=marker] run fill ~ 68 59969 ~ 87 59969 gravel replace bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 88 59969 ~ 90 59969 chiseled_stone_bricks replace packed_mud
execute at @n[tag=tf.border,type=marker] run fill ~ 88 59969 ~ 90 59969 chiseled_stone_bricks replace mud_bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 91 59969 ~ 91 59969 stone_brick_wall replace mud_brick_wall
execute at @n[tag=tf.border,type=marker] run fill ~ 92 59969 ~ 93 59969 iron_bars replace waxed_copper_bars


execute at @n[tag=tf.border,type=marker] run fill ~ 65 60020 ~ 67 60020 stone_bricks replace mud_bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 68 60020 ~ 87 60020 polished_andesite replace polished_granite
execute at @n[tag=tf.border,type=marker] run fill ~ 68 60020 ~ 87 60020 andesite replace granite
execute at @n[tag=tf.border,type=marker] run fill ~ 68 60020 ~ 87 60020 stone replace terracotta
execute at @n[tag=tf.border,type=marker] run fill ~ 68 60020 ~ 87 60020 gravel replace bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 88 60020 ~ 90 60020 chiseled_stone_bricks replace packed_mud
execute at @n[tag=tf.border,type=marker] run fill ~ 88 60020 ~ 90 60020 chiseled_stone_bricks replace mud_bricks
execute at @n[tag=tf.border,type=marker] run fill ~ 91 60020 ~ 91 60020 stone_brick_wall replace mud_brick_wall
execute at @n[tag=tf.border,type=marker] run fill ~ 92 60020 ~ 93 60020 iron_bars replace waxed_copper_bars

scoreboard players add ?turf tf.state 1
give @a[team=tf.red] red_wool[can_place_on={blocks:["red_wool","red_terracotta"]}] 2
give @a[team=tf.blue] blue_wool[can_place_on={blocks:["blue_wool","blue_terracotta"]}] 2