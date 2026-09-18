# ============================================================
# walls:end/win_it
# Called by: walls:tower/tick (once)
# Executor:  Server
#
# Data lost both ravagers.
# ============================================================

title @a times 5 70 20
title @a title [{text:"IT",color:"#cc99ff",bold:true},{text:" WINS",color:"white",bold:true}]
title @a subtitle {text:"Both Data ravagers are down",color:"gray"}
tellraw @a [{text:"IT",color:"#cc99ff",bold:true},{text:" wins — both Data ravagers are down!",color:"white"}]

execute as @a[team=main.it,tag=!admin] run function main:api/give_points {points:150,reason:"Your team won"}

function walls:end/finish
