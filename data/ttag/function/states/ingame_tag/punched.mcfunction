advancement revoke @s only ttag:punched

# dont run function if game or state is wrong
execute unless score game.id GLOBAL matches 1 run return 0
execute unless score ?state ttag.game matches 21 run return 0
# dont run if attacker does not have tnt
execute on attacker if entity @s[team=!ttag.tagged] run return 0
# dont run if victim has tnt
execute if entity @s[team=ttag.tagged] run return 0

## transfer tnt
execute on attacker run team leave @s
team join ttag.tagged @s

# clear effects for tagger
execute on attacker run effect clear @s speed
execute on attacker run effect clear @s jump_boost

## display
tag @a remove ttag.temp.attacker
execute on attacker run tag @s add ttag.temp.attacker
tellraw @s [{"selector":"@p[tag=ttag.temp.attacker]","color":"red"},{"text":" tagged you","color":"gray"}]
tellraw @p[tag=ttag.temp.attacker] [{"text":"you tagged ","color":"gray"},{"selector":"@s","color":"red"}]
execute at @s run particle lava ~ ~1 ~ .5 .5 .5 0 5 normal @a
#execute at @s run playsound entity.arrow.hit_player player @s ~ ~ ~
execute on attacker at @s run playsound entity.arrow.hit_player player @s ~ ~ ~
tag @a remove ttag.temp.attacker