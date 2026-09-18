# ============================================================
# tgttos:cap/point
# Called by: tgttos:cap/tick
# Executor:  Server
#
# Macro args: {n:"1"}  — which control point to run.
#
# One point, one signed progress bar (?progN, -200..200 ticks,
# positive is Data). Whoever is alone inside the 5 block radius
# pushes it one tick their way; both teams present, or nobody
# present, and it does not move. That single bar is what makes
# "B has to rewind A's progress at the same speed before they
# can start their own" fall out for free.
#
# ?ownN latches at 1 (Data) or 2 (IT) the moment the bar hits
# that team's end, and is never set back to 0 — a point that has
# been taken once stays owned until the other side reaches the
# far end of the bar, which is a full 20 seconds alone on it.
# ============================================================

scoreboard players set #data tgttos.temp 0
scoreboard players set #it tgttos.temp 0
$execute at @e[type=marker,tag=tgttos.p$(n),limit=1] store result score #data tgttos.temp if entity @a[team=main.data,tag=!admin,gamemode=adventure,distance=..5]
$execute at @e[type=marker,tag=tgttos.p$(n),limit=1] store result score #it tgttos.temp if entity @a[team=main.it,tag=!admin,gamemode=adventure,distance=..5]

# contested, or empty: the bar holds where it is
execute if score #data tgttos.temp matches 1.. if score #it tgttos.temp matches 1.. run return 0
execute if score #data tgttos.temp matches 0 if score #it tgttos.temp matches 0 run return 0

$execute if score #data tgttos.temp matches 1.. run scoreboard players add ?prog$(n) tgttos.state 1
$execute if score #it tgttos.temp matches 1.. run scoreboard players remove ?prog$(n) tgttos.state 1
$execute if score ?prog$(n) tgttos.state matches 201.. run scoreboard players set ?prog$(n) tgttos.state 200
$execute if score ?prog$(n) tgttos.state matches ..-201 run scoreboard players set ?prog$(n) tgttos.state -200

$execute if score ?prog$(n) tgttos.state matches 200 unless score ?own$(n) tgttos.state matches 1 run function tgttos:cap/cap_data {n:"$(n)"}
$execute if score ?prog$(n) tgttos.state matches -200 unless score ?own$(n) tgttos.state matches 2 run function tgttos:cap/cap_it {n:"$(n)"}
