# ============================================================
# tgttos:cap/cap_data
# Called by: tgttos:cap/point (once per capture)
# Executor:  Server
#
# Macro args: {n:"1"}  — the point Data just took.
# ============================================================

$scoreboard players set ?own$(n) tgttos.state 1
$execute at @e[type=marker,tag=tgttos.p$(n),limit=1] run function tgttos:map/paint_data
$execute at @e[type=marker,tag=tgttos.p$(n),limit=1] as @a[team=main.data,tag=!admin,gamemode=adventure,distance=..5] run function tgttos:cap/reward

$tellraw @a [{text:"Data",color:"#e83d84",bold:true},{text:" captured ",color:"white"},{text:"Point $(n)",color:"white",bold:true},{text:"!",color:"white"}]
execute as @a at @s run playsound minecraft:block.beacon.power_select master @s ~ ~ ~ 1 1.2
