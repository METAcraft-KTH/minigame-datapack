# ============================================================
# walls:tower/it_fell
# Called by: walls:tower/tick
# Executor:  Server
# ============================================================

tellraw @a [{text:"An ",color:"gray"},{text:"IT",color:"#cc99ff",bold:true},{text:" ravager has fallen!",color:"gray"}]
execute as @a at @s run playsound entity.ravager.death master @s ~ ~ ~ 1 1
