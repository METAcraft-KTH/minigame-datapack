# ============================================================
# tgttos:debug/status
# Called by: an operator, by hand
# Executor:  Server
# ============================================================

execute store result score #n tgttos.temp if entity @e[type=minecraft:marker,tag=tgttos.point]
tellraw @s ["",{text:"[tgttos] markers "},{score:{name:"#n",objective:"tgttos.temp"}},{text:" | point 1 owner "},{score:{name:"?own1",objective:"tgttos.state"}},{text:" prog "},{score:{name:"?prog1",objective:"tgttos.state"}},{text:" | point 2 owner "},{score:{name:"?own2",objective:"tgttos.state"}},{text:" prog "},{score:{name:"?prog2",objective:"tgttos.state"}}]
tellraw @s ["",{text:"[tgttos] data "},{score:{name:"?t_data",objective:"tgttos.timer"}},{text:" ticks left | it "},{score:{name:"?t_it",objective:"tgttos.timer"}},{text:" ticks left | match "},{score:{name:"?match_timer",objective:"tgttos.timer"}}]
