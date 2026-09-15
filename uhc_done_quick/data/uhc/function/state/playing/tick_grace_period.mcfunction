
scoreboard players operation ?time_until_pvp uhc.time = ?grace_period_time uhc.time
scoreboard players operation ?time_until_pvp uhc.time -= ?timer uhc.time

# Bossbar
bossbar set uhc:bossbar players @a
bossbar set uhc:bossbar visible true
execute store result bossbar uhc:bossbar value run scoreboard players get ?time_until_pvp uhc.time
execute store result bossbar uhc:bossbar max run scoreboard players get ?grace_period_time uhc.time

#   get formatted time string to display in bossbar
scoreboard players operation #ticks main.temp = ?time_until_pvp uhc.time
execute store result score #min uhc.temp run compute default integer main:time/min
execute store result score #sec_tens uhc.temp run compute default integer main:time/sec_tens
execute store result score #sec_ones uhc.temp run compute default integer main:time/sec_ones
#   set bossbar name
bossbar set uhc:bossbar name [{score:{name:"#min",objective:"uhc.temp"},color:"green"},":",{score:{name:"#sec_tens",objective:"uhc.temp"}},{score:{name:"#sec_ones",objective:"uhc.temp"}},{text:" until PvP is enabled & border starts shrinking",color:"white"}]

execute if score ?time_until_pvp uhc.time matches 0 run function uhc:state/playing/grace_period_end
