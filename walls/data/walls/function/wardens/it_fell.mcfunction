# ============================================================
# walls:wardens/it_fell
# Called by: walls:wardens/tick
# Executor:  Server
# ============================================================

tellraw @a [{text:"An ",color:"gray"},{text:"IT",color:"#cc99ff",bold:true},{text:" warden has fallen!",color:"gray"}]
execute as @a at @s run playsound entity.warden.death master @s ~ ~ ~ 1 1
