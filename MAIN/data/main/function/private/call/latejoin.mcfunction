# ============================================================
# Called by: _tick
# Executor:  Player who joined the server AFTER game start
# 
# Lets the game figure out what to do with players who
# wasn't present when the game started.
# 
# ============================================================

execute if score ?minigame_id main.state matches 1 run function main:private/call/macro/latejoin with storage main:game display[1]
execute if score ?minigame_id main.state matches 2 run function main:private/call/macro/latejoin with storage main:game display[2]
execute if score ?minigame_id main.state matches 3 run function main:private/call/macro/latejoin with storage main:game display[3]
execute if score ?minigame_id main.state matches 4 run function main:private/call/macro/latejoin with storage main:game display[4]
execute if score ?minigame_id main.state matches 5 run function main:private/call/macro/latejoin with storage main:game display[5]
execute if score ?minigame_id main.state matches 6 run function main:private/call/macro/latejoin with storage main:game display[6]

scoreboard players set @s main.iwashere 1