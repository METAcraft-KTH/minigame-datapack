# ============================================================
# walls:end/win_data
# Called by: walls:golem/tick (once)
# Executor:  Server
#
# IT lost both golems.
# ============================================================

title @a times 5 70 20
title @a title [{text:"Data",color:"#e83d84",bold:true},{text:" WINS",color:"white",bold:true}]
title @a subtitle {text:"Both IT golems are down",color:"gray"}
tellraw @a [{text:"Data",color:"#e83d84",bold:true},{text:" wins — both IT golems are down!",color:"white"}]

execute as @a[team=main.data,tag=!admin] run function main:api/give_points {points:150,reason:"Your team won"}

function walls:end/finish
