# choose random teamless player
team join tnttag.has_diamond @r[tag=!admin,team=]
scoreboard players remove ?diamond_count tnttag.temp 1

execute if score ?diamond_count tnttag.temp matches 1.. run function tnttag:state/ingame_tag/assign_diamond