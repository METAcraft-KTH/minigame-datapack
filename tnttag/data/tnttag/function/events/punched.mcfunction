# executed from the victim's perspective

advancement revoke @s only tnttag:punch

# reject if not in right game
#execute unless score ?minigame_id main.state matches 2 run return 0

tag @a remove tnttag.punched
tag @a remove tnttag.puncher

tag @s add tnttag.punched
execute on attacker run tag @s add tnttag.puncher

# if the victim does NOT have diamond AND the attacker does NOT have tnt, do nothing
execute if entity @s[team=!tnttag.has_diamond] if entity @p[tag=tnttag.puncher,team=!tnttag.has_tnt] run return 0

effect clear @s
effect clear @p[tag=tnttag.puncher]

# if victim has diamond and the attacker does NOT have tnt
execute if entity @s[team=tnttag.has_diamond] if entity @p[tag=tnttag.puncher,team=!tnttag.has_tnt] run return run function tnttag:events/punched_diamond
# if victim has NO diamond and the attacker has tnt
execute if entity @s[team=!tnttag.has_diamond] if entity @p[tag=tnttag.puncher,team=tnttag.has_tnt] run return run function tnttag:events/punched_tnt
# if victim has diamond AND the attacker has tnt
execute if entity @s[team=tnttag.has_diamond] if entity @p[tag=tnttag.puncher,team=tnttag.has_tnt] run return run function tnttag:events/punched_both