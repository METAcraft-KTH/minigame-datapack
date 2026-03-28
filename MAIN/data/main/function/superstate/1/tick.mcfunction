# ============================================================
# Called by: _tick (each tick, state 1)
# Executor:  Server
# 
# Runs per tick while in the lobby.
# 
# ============================================================

spawnpoint @a 0 100 50000

# --- DECREMENT TIMER ---
scoreboard players remove ?supertimer main.time 1

# --- UPDATE BOSSBAR ---
bossbar set main:timer players @a
bossbar set main:timer visible true
execute store result bossbar main:timer value run scoreboard players get ?supertimer main.time
#   get formatted time string to display in bossbar
execute store result storage main:temp t int 1 run scoreboard players get ?supertimer main.time
execute store result score #min main.temp run function main:util/time_format_minsec_min with storage main:temp
execute store result score #sec main.temp run function main:util/time_format_minsec_sec with storage main:temp
#   set bossbar name
execute if score #sec main.temp matches ..9 unless score ?minigame_id main.state matches 1 run bossbar set main:timer name [{score:{name:"#min",objective:"main.temp"},color:"green"},":0",{score:{name:"#sec",objective:"main.temp"}},{text:" until the next game begins",color:"white"}]
execute if score #sec main.temp matches 10.. unless score ?minigame_id main.state matches 1 run bossbar set main:timer name [{score:{name:"#min",objective:"main.temp"},color:"green"},":",{score:{name:"#sec",objective:"main.temp"}},{text:" until the next game begins",color:"white"}]
#   special formatting if the game is 1
execute if score #sec main.temp matches ..9 if score ?minigame_id main.state matches 1 run bossbar set main:timer name [{score:{name:"#min",objective:"main.temp"},color:"green"},":0",{score:{name:"#sec",objective:"main.temp"}},[{text:" until ",color:"white"},{text:"MINECRAFT HEXATHLON 5",color:"gold",bold:1b}," begins"]]
execute if score #sec main.temp matches 10.. if score ?minigame_id main.state matches 1 run bossbar set main:timer name [{score:{name:"#min",objective:"main.temp"},color:"green"},":",{score:{name:"#sec",objective:"main.temp"}},[{text:" until ",color:"white"},{text:"MINECRAFT HEXATHLON 5",color:"gold",bold:1b}," begins"]]

# --- SHOW FULLSCREEN TITLE TRANSITION ---
execute if score ?supertimer main.time matches 20 run title @a times 20 20 20
execute if score ?supertimer main.time matches 20 run title @a title {"text":"ABA","font":"hexathlon:font","shadow_color":0}

# --- BEGIN INTRO ---
execute if score ?supertimer main.time matches 0 run function main:superstate/1/go_to_state_2
