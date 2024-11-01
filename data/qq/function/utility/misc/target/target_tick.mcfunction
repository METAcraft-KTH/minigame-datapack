execute unless block ~ ~ ~ target[power=0] as @e[type=arrow,distance=..2] if data entity @s {inGround:1b} on origin at @s run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 100 1 1
execute unless block ~ ~ ~ target[power=0] run kill @e[type=arrow,distance=..2]
execute unless block ~ ~ ~ target[power=0] run function qq:utility/misc/target/relocate