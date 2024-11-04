### Run while in game with mode ghost trick

## ghost trick invis
execute as @e[type=trident] on origin if score @s qq.tridentInvis matches 1.. run scoreboard players remove @s qq.tridentInvis 2
execute as @a if score @s qq.tridentInvis matches 1.. if items entity @s weapon.* trident run scoreboard players remove @s qq.tridentInvis 2
execute as @a unless score @s qq.tridentInvis matches 40.. run scoreboard players add @a qq.tridentInvis 1
execute as @a if score @s qq.tridentInvis matches ..1 run effect give @s minecraft:invisibility 2 0 false