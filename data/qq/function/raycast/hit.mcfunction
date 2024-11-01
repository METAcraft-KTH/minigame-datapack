tag @s add hit
scoreboard players add %count var 1

#say @s was hit by @p[tag=this]

#effect give @s glowing 1 0 true
execute as @a[tag=thisOwner] at @s run playsound minecraft:entity.arrow.hit_player player @s ~ ~ ~ 100 1 1
damage @s 100 arrow by @p[tag=thisOwner]