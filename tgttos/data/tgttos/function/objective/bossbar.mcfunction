# ============================================================
# tgttos:objective/bossbar
# Called by: tgttos:util/second, tgttos:on/gamestart
# Executor:  Server
#
# Each team's remaining objective time as MM:SS. The two bars
# need separate score holders because the score components are
# read live, every frame, by whoever is looking at them — one
# shared #min would make both bars show the same number.
#
# The name also says whether that bar is moving, because a bar
# that has been stuck at 2:12 for a minute is the single most
# useful thing on the screen.
# ============================================================

scoreboard players set #data_holds tgttos.temp 0
scoreboard players set #it_holds tgttos.temp 0
execute if score ?own1 tgttos.state matches 1 if score ?own2 tgttos.state matches 1 run scoreboard players set #data_holds tgttos.temp 1
execute if score ?own1 tgttos.state matches 2 if score ?own2 tgttos.state matches 2 run scoreboard players set #it_holds tgttos.temp 1

scoreboard players operation #ticks main.temp = ?t_data tgttos.timer
execute store result score #d_min tgttos.temp run compute default integer main:time/min
execute store result score #d_tens tgttos.temp run compute default integer main:time/sec_tens
execute store result score #d_ones tgttos.temp run compute default integer main:time/sec_ones
execute if score #data_holds tgttos.temp matches 1 run bossbar set tgttos:data name [{text:"Data ",color:"#e83d84",bold:true},{score:{name:"#d_min",objective:"tgttos.temp"},color:"white"},{text:":",color:"white"},{score:{name:"#d_tens",objective:"tgttos.temp"},color:"white"},{score:{name:"#d_ones",objective:"tgttos.temp"},color:"white"},{text:" — holding both points",color:"green"}]
execute unless score #data_holds tgttos.temp matches 1 run bossbar set tgttos:data name [{text:"Data ",color:"#e83d84",bold:true},{score:{name:"#d_min",objective:"tgttos.temp"},color:"gray"},{text:":",color:"gray"},{score:{name:"#d_tens",objective:"tgttos.temp"},color:"gray"},{score:{name:"#d_ones",objective:"tgttos.temp"},color:"gray"},{text:" — stopped",color:"dark_gray"}]

scoreboard players operation #ticks main.temp = ?t_it tgttos.timer
execute store result score #i_min tgttos.temp run compute default integer main:time/min
execute store result score #i_tens tgttos.temp run compute default integer main:time/sec_tens
execute store result score #i_ones tgttos.temp run compute default integer main:time/sec_ones
execute if score #it_holds tgttos.temp matches 1 run bossbar set tgttos:it name [{text:"IT ",color:"#cc99ff",bold:true},{score:{name:"#i_min",objective:"tgttos.temp"},color:"white"},{text:":",color:"white"},{score:{name:"#i_tens",objective:"tgttos.temp"},color:"white"},{score:{name:"#i_ones",objective:"tgttos.temp"},color:"white"},{text:" — holding both points",color:"green"}]
execute unless score #it_holds tgttos.temp matches 1 run bossbar set tgttos:it name [{text:"IT ",color:"#cc99ff",bold:true},{score:{name:"#i_min",objective:"tgttos.temp"},color:"gray"},{text:":",color:"gray"},{score:{name:"#i_tens",objective:"tgttos.temp"},color:"gray"},{score:{name:"#i_ones",objective:"tgttos.temp"},color:"gray"},{text:" — stopped",color:"dark_gray"}]
