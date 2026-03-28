scoreboard players add @s uhc.recursion_depth 1
execute if score @s uhc.recursion_depth matches 50.. run return 0
tp @s ~ ~2 ~
execute at @s unless block ~ ~1 ~ air run function uhc:border/tp_up_step
