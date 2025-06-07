# kill pearls if they end up in the killbox
execute store result score @s tgttos.Y run data get entity @s Pos[1] 1
execute if score @s tgttos.Y matches 0.. run kill @s