# kill pearls if they end up in the killbox
execute store result score @s exact.Y run data get entity @s Pos[1] 1
execute if score @s exact.Y matches ..12 run kill @s