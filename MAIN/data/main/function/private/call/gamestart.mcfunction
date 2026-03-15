# ============================================================
# Called by: main:superstate/2/go_to_state_3
# Executor:  Server
# 
# Calls the respective game's start function to let
# it know that it's their turn to manage things.
# 
# ============================================================

execute if score ?minigame_id main.state matches 1 run function main:private/call/macro/gamestart with storage main:game display[1]
execute if score ?minigame_id main.state matches 2 run function main:private/call/macro/gamestart with storage main:game display[2]
execute if score ?minigame_id main.state matches 3 run function main:private/call/macro/gamestart with storage main:game display[3]
execute if score ?minigame_id main.state matches 4 run function main:private/call/macro/gamestart with storage main:game display[4]
execute if score ?minigame_id main.state matches 5 run function main:private/call/macro/gamestart with storage main:game display[5]
execute if score ?minigame_id main.state matches 6 run function main:private/call/macro/gamestart with storage main:game display[6]