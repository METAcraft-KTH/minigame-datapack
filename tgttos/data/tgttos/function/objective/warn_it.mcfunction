# ============================================================
# tgttos:objective/warn_it
# Called by: tgttos:objective/tick (once)
# Executor:  Server
# ============================================================

scoreboard players set ?warn_it tgttos.state 1
tellraw @a [{text:"IT",color:"#cc99ff",bold:true},{text:" is 10 seconds from the win. Get on a point.",color:"white"}]
execute as @a at @s run playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 0.6
