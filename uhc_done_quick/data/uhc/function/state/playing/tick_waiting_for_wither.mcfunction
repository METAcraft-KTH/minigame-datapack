
scoreboard players operation ?time_until_wither uhc.time = ?wither_spawn_time uhc.time
scoreboard players operation ?time_until_wither uhc.time -= ?timer uhc.time

# Bossbar
bossbar set uhc:bossbar players @a
bossbar set uhc:bossbar visible true
execute store result bossbar uhc:bossbar value run scoreboard players get ?time_until_wither uhc.time
execute store result bossbar uhc:bossbar max run scoreboard players get ?grace_period_time uhc.time

#   get formatted time string to display in bossbar
execute store result storage uhc:temp t int 1 run scoreboard players get ?time_until_wither uhc.time
execute store result score #min uhc.temp run function main:util/time_format_minsec_min with storage uhc:temp
execute store result score #sec uhc.temp run function main:util/time_format_minsec_sec with storage uhc:temp
#   set bossbar name
execute if score #sec uhc.temp matches ..9 unless score ?minigame_id uhc.state matches 1 run bossbar set uhc:bossbar name [{score:{name:"#min",objective:"uhc.temp"},color:"green"},":0",{score:{name:"#sec",objective:"uhc.temp"}},{text:" until withers spawn",color:"white"}]
execute if score #sec uhc.temp matches 10.. unless score ?minigame_id uhc.state matches 1 run bossbar set uhc:bossbar name [{score:{name:"#min",objective:"uhc.temp"},color:"green"},":",{score:{name:"#sec",objective:"uhc.temp"}},{text:" until withers spawn",color:"white"}]

execute if score ?time_until_wither uhc.time matches 0 run function uhc:state/playing/spawn_withers
