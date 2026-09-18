# ============================================================
# walls:tower/data_fell
# Called by: walls:tower/tick
# Executor:  Server
# ============================================================

tellraw @a [{text:"A ",color:"gray"},{text:"Data",color:"#e83d84",bold:true},{text:" ravager has fallen!",color:"gray"}]
execute as @a at @s run playsound entity.ravager.death master @s ~ ~ ~ 1 1
