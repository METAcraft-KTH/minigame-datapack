# ============================================================
# tgttos:objective/warn_data
# Called by: tgttos:objective/tick (once)
# Executor:  Server
# ============================================================

scoreboard players set ?warn_data tgttos.state 1
tellraw @a [{text:"Data",color:"#e83d84",bold:true},{text:" is 10 seconds from the win. Get on a point.",color:"white"}]
execute as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 0.6
