# ============================================================
# Called by: _tick (each tick, state 1)
# Executor:  Server
# 
# Runs per tick while in the lobby.
# 
# ============================================================

spawnpoint @a 0 100 50000
setworldspawn 0 100 50000

# --- DECREMENT TIMER ---
scoreboard players remove ?supertimer main.time 1

# --- UPDATE BOSSBAR ---
bossbar set main:timer players @a
bossbar set main:timer visible true
execute store result bossbar main:timer value run scoreboard players get ?supertimer main.time
#   get formatted time string to display in bossbar
scoreboard players operation #ticks main.temp = ?supertimer main.time
execute store result score #min main.temp run compute default integer main:time/min
execute store result score #sec_tens main.temp run compute default integer main:time/sec_tens
execute store result score #sec_ones main.temp run compute default integer main:time/sec_ones
#   set bossbar name
execute unless score ?minigame_id main.state matches 1 run bossbar set main:timer name [{score:{name:"#min",objective:"main.temp"},color:"green"},":",{score:{name:"#sec_tens",objective:"main.temp"}},{score:{name:"#sec_ones",objective:"main.temp"}},{text:" until the next game begins",color:"white"}]
#   special formatting if the game is 1
execute if score ?minigame_id main.state matches 1 run bossbar set main:timer name [{score:{name:"#min",objective:"main.temp"},color:"green"},":",{score:{name:"#sec_tens",objective:"main.temp"}},{score:{name:"#sec_ones",objective:"main.temp"}},[{text:" until ",color:"white"},{text:"METACRAFT RIVALS",color:"gold",bold:1b}," begins"]]

# --- TEAM SELECTION ---
function main:team/tick

# --- SERIES SCORE ---
function main:util/lobby_actionbar

# --- DONT LET PLAYERS DIE ---
#   tp players who fell off
execute as @a[tag=!admin] if predicate {type:"entity_properties",entity:"this",predicate:{"minecraft:location":{position:{y:{max:0}}}}} run tp @s 0 64 50000
#   tp players who are too far away from spawn
execute positioned 0 0 50000 run tp @a[tag=!admin,distance=5000..] 0 64 50000
#   regen
effect give @a saturation 3 1 true
effect give @a instant_health 3 1 true
effect give @a resistance 3 4 true

# --- SHOW FULLSCREEN TITLE TRANSITION ---
execute if score ?supertimer main.time matches 20 run title @a times 20 20 20
execute if score ?supertimer main.time matches 20 run title @a title {"text":"ABA","font":"hexathlon:font","shadow_color":0}

# --- BEGIN INTRO ---
execute if score ?supertimer main.time matches 0 run function main:superstate/1/go_to_state_2
