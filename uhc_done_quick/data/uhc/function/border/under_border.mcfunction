damage @s 1 outside_border
effect give @s levitation 1 3 true
title @s actionbar {"text":"You are under the world border!","color":"red"}

scoreboard players add @s uhc.under_border 1
execute if score @s uhc.under_border matches 3.. at @s run function uhc:border/tp_up