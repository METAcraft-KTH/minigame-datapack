# ============================================================
# walls:golem/it_fell
# Called by: walls:golem/tick
# Executor:  Server
# ============================================================

tellraw @a [{text:"An ",color:"gray"},{text:"IT",color:"#cc99ff",bold:true},{text:" golem has fallen!",color:"gray"}]
execute as @a at @s run playsound entity.iron_golem.death master @s ~ ~ ~ 1 1
