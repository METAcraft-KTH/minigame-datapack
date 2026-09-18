# ============================================================
# walls:wardens/data_fell
# Called by: walls:wardens/tick
# Executor:  Server
# ============================================================

tellraw @a [{text:"A ",color:"gray"},{text:"Data",color:"#e83d84",bold:true},{text:" warden has fallen!",color:"gray"}]
execute as @a at @s run playsound entity.warden.death master @s ~ ~ ~ 1 1
