# ============================================================
# tgttos:cap/cap_it
# Called by: tgttos:cap/point (once per capture)
# Executor:  Server
#
# Macro args: {n:"1"}  — the point IT just took.
# ============================================================

$scoreboard players set ?own$(n) tgttos.state 2
$execute at @e[type=marker,tag=tgttos.p$(n),limit=1] run function tgttos:map/paint_it
$execute at @e[type=marker,tag=tgttos.p$(n),limit=1] as @a[team=main.it,tag=!admin,gamemode=adventure,distance=..5] run function tgttos:cap/reward

$tellraw @a [{text:"IT",color:"#cc99ff",bold:true},{text:" captured ",color:"white"},{text:"Point $(n)",color:"white",bold:true},{text:"!",color:"white"}]
execute as @a at @s run playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 0.8
