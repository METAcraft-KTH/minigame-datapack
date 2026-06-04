# called by enter to determine how many players get tnts and diamonds

# find out how many players matches the % we want
execute store result score ?tnt_count tnttag.temp if entity @a[tag=!admin]

scoreboard players operation ?tnt_count tnttag.temp *= ?tnt_percentage tnttag.state
scoreboard players operation ?tnt_count tnttag.temp /= #100 main.const

function tnttag:state/ingame_tag/assign_tnt/loop