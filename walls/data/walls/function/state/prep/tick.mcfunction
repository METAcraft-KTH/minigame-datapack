# ============================================================
# walls:state/prep/tick
# Called by: walls:_tick
# Executor:  Server
#
# Phase 0: the wall is up. 10 minutes (12000 ticks) to mine,
# craft and fortify.
# ============================================================

# --- COUNTDOWN BOSSBAR ---
scoreboard players set #left walls.temp 12000
scoreboard players operation #left walls.temp -= ?match_timer walls.timer
execute store result bossbar walls:timer value run scoreboard players get #left walls.temp

scoreboard players operation #ticks main.temp = #left walls.temp
execute store result score #min walls.temp run compute default integer main:time/min
execute store result score #sec_tens walls.temp run compute default integer main:time/sec_tens
execute store result score #sec_ones walls.temp run compute default integer main:time/sec_ones
bossbar set walls:timer name [{text:"The wall drops in ",color:"white"},{score:{name:"#min",objective:"walls.temp"},color:"yellow"},{text:":",color:"yellow"},{score:{name:"#sec_tens",objective:"walls.temp"},color:"yellow"},{score:{name:"#sec_ones",objective:"walls.temp"},color:"yellow"}]

# --- WARNINGS ---
execute if score ?match_timer walls.timer matches 9600 run function walls:state/prep/warn
execute if score ?match_timer walls.timer matches 10800 run function walls:state/prep/warn
execute if score ?match_timer walls.timer matches 11400 run function walls:state/prep/warn
execute if score ?match_timer walls.timer matches 11800 run function walls:state/prep/warn
execute if score ?match_timer walls.timer matches 11900 run function walls:state/prep/warn

# --- WALL DROPS ---
execute if score ?match_timer walls.timer matches 12000.. run function walls:state/drop/enter
