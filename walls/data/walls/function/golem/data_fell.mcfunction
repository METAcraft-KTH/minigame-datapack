# ============================================================
# walls:golem/data_fell
# Called by: walls:golem/tick
# Executor:  Server
# ============================================================

tellraw @a [{text:"A ",color:"gray"},{text:"Data",color:"#e83d84",bold:true},{text:" golem has fallen!",color:"gray"}]
execute as @a at @s run playsound entity.iron_golem.death master @s ~ ~ ~ 1 1
