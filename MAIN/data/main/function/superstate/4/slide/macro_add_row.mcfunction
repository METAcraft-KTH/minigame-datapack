# ============================================================
# Called by: main:superstate/4/slide/rank_next (once per row)
# Executor:  Server
# Macro args: {row:1, place:1, value:"1:23.45"}
# 
# Appends a leaderboard row to storage main:temp rows.
# The player name, prefix and suffix are resolved when the row
# is displayed with tellraw (interpret:true).
# 
# ============================================================

$data modify storage main:temp rows append value ["$(place). ",{selector:"@a[scores={main.temp.rank=$(row)}]",color:"yellow"}," - ",{storage:"main:temp",nbt:"stats[0].prefix",interpret:true},{text:$(value),color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix",interpret:true}]
