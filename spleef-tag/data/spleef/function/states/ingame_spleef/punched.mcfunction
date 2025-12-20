advancement revoke @s only spleef:punched

# dont run function if game or state is wrong
execute unless score game.id GLOBAL matches 4 run return 0
execute unless score ?state spleef.game matches 22 run return 0
# dont run if attacker does not have tnt
execute on attacker if entity @s[scores={spleef.hastnt=..0}] run return 0
# dont run if victim has tnt
execute if entity @s[scores={spleef.hastnt=1..}] run return 0

## transfer tnt
execute on attacker run clear @s tnt
execute on attacker run scoreboard players set @s spleef.hastnt 0
give @s tnt[item_name="Punch someone to give me away!"]
scoreboard players set @s spleef.hastnt 1

## display
tag @a remove spleef.temp.attacker
execute on attacker run tag @s add spleef.temp.attacker
tellraw @s [{"selector":"@p[tag=spleef.temp.attacker]","color":"red"},{"text":" tagged you, punch someone else to give away the TNT!","color":"gray"}]
tellraw @p[tag=spleef.temp.attacker] [{"text":"you tagged ","color":"gray"},{"selector":"@s","color":"red"}]
execute at @s run particle lava ~ ~1 ~ .5 .5 .5 0 5 normal @a
# playsound
execute at @s run playsound entity.creeper.hurt player @s ~ ~ ~
execute on attacker at @s run playsound entity.arrow.hit_player player @s ~ ~ ~
tag @a remove spleef.temp.attacker