# ============================================================
# tgttos:end/win_it
# Called by: tgttos:objective/tick, tgttos:end/timeout (once)
# Executor:  Server
# ============================================================

scoreboard players set ?over tgttos.state 1

title @a times 5 70 20
title @a title [{text:"IT",color:"#cc99ff",bold:true},{text:" WINS",color:"white",bold:true}]
title @a subtitle {text:"They crossed that bridge",color:"gray"}
tellraw @a [{text:"IT",color:"#cc99ff",bold:true},{text:" ran the clock out holding both points!",color:"white"}]

execute as @a[team=main.it,tag=!admin] run function main:api/give_points {points:150,reason:"Your team won"}

function tgttos:end/finish
