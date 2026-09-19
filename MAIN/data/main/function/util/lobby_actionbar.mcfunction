# ============================================================
# Called by: main:superstate/0/tick, main:superstate/1/tick
# Executor:  Server
#
# Keeps the best-of-5 series score on everyone's actionbar
# while we're sitting in the lobby.
# ============================================================

title @a actionbar ["",{text:"Data ",color:"#e83d84",bold:true},{score:{name:"?wins_data",objective:"main.state"},color:"white",bold:true},{text:" — ",color:"gray"},{score:{name:"?wins_it",objective:"main.state"},color:"white",bold:true},{text:" IT",color:"#cc99ff",bold:true}]
