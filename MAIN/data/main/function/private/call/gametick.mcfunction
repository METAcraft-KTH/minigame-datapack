# ============================================================
# Called by: _tick
# Executor:  Server
# 
# Calls the respective game's tick function while the game
# is actively running.
# 
# ============================================================

execute if score ?minigame_id main.state matches 1 run function main:private/call/macro/gametick with storage main:game display[1]
execute if score ?minigame_id main.state matches 2 run function main:private/call/macro/gametick with storage main:game display[2]
execute if score ?minigame_id main.state matches 3 run function main:private/call/macro/gametick with storage main:game display[3]
execute if score ?minigame_id main.state matches 4 run function main:private/call/macro/gametick with storage main:game display[4]
execute if score ?minigame_id main.state matches 5 run function main:private/call/macro/gametick with storage main:game display[5]
execute if score ?minigame_id main.state matches 6 run function main:private/call/macro/gametick with storage main:game display[6]