# ============================================================
# Called by: main:api/end_game_data, main:api/end_game_it,
#            main:superstate/4/tick, main:superstate/4/go_to_state_5
# Executor:  Server
#
# Prints the best-of-5 series score to chat.
# ============================================================

tellraw @a ["",{text:"\nSeries: ",color:"gray"},{text:"Data ",color:"#e83d84",bold:true},{score:{name:"?wins_data",objective:"main.state"},color:"white",bold:true},{text:" — ",color:"gray"},{score:{name:"?wins_it",objective:"main.state"},color:"white",bold:true},{text:" IT\n",color:"#cc99ff",bold:true}]
