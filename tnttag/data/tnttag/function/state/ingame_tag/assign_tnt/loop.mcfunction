# choose random teamless player
team join tnttag.has_tnt @r[tag=!admin,team=]
scoreboard players remove ?tnt_count tnttag.temp 1

# if the amount of players starting with tnt reaches 50% (for some reason), don't continue
execute store result score ?a tnttag.temp if entity @a[tag=!admin,team=tnttag.has_tnt]
execute store result score ?b tnttag.temp if entity @a[tag=!admin,team=]
execute if score ?a tnttag.temp >= ?b tnttag.temp run return 0

execute if score ?tnt_count tnttag.temp matches 1.. run function tnttag:state/ingame_tag/assign_tnt/loop