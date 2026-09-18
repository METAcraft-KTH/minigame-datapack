# ============================================================
# walls:end/win_it
# Called by: walls:wardens/tick (once)
# Executor:  Server
#
# Data lost both wardens.
# ============================================================

title @a times 5 70 20
title @a title [{text:"IT",color:"#cc99ff",bold:true},{text:" WINS",color:"white",bold:true}]
title @a subtitle {text:"Both Data wardens are down",color:"gray"}
tellraw @a [{text:"IT",color:"#cc99ff",bold:true},{text:" wins — both Data wardens are down!",color:"white"}]

execute as @a[team=main.it,tag=!admin] run function main:api/give_points {points:150,reason:"Your team won"}

function walls:end/finish
