scoreboard players set @s uhc.under_border 0
scoreboard players set @s uhc.recursion_depth 0

# Recursivly teleport up until the player is not inside blocks
execute unless block ~ ~2 ~ air run function uhc:border/tp_up_step
execute unless block ~ ~2 ~ air run tellraw @s {"text":"You were teleported up to prevent suffocation!","color":"yellow"}
