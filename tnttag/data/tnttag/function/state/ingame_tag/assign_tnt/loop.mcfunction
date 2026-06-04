# choose random teamless player
team join tnttag.has_tnt @r[tag=!admin,team=]
scoreboard players remove ?tnt_count tnttag.temp 1

execute if score ?tnt_count tnttag.temp matches 1.. run function tnttag:state/ingame_tag/assign_tnt/loop