# ============================================================
# tgttos:end/win_data
# Called by: tgttos:objective/tick, tgttos:end/timeout (once)
# Executor:  Server
# ============================================================

scoreboard players set ?over tgttos.state 1

title @a times 5 70 20
title @a title [{text:"Data",color:"#e83d84",bold:true},{text:" WINS",color:"white",bold:true}]
title @a subtitle {text:"They crossed that bridge",color:"gray"}
tellraw @a [{text:"Data",color:"#e83d84",bold:true},{text:" ran the clock out holding both points!",color:"white"}]

execute as @a[team=main.data,tag=!admin] run function main:api/give_points {points:150,reason:"Your team won"}

function tgttos:end/finish
