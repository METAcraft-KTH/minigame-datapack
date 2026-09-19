# ============================================================
# splat:api/end_game
# Called by: the MOD, when Paint the Campus is over
# Executor:  Server
#
# Announces the winner and hands superstate 3 -> 4 back to MAIN,
# awarding the best-of-5 series point to the winning team.
#
# The mod sets ?winner splat.state FIRST, then calls this:
#   1 = Data won
#   2 = IT won
#   0 = draw / nobody won
#
# (Calling main:api/end_game directly still works, but it always
#  counts as a draw and skips the announcement.)
# ============================================================

scoreboard players set ?running splat.state 0

title @a clear
title @a times 5 70 20
execute if score ?winner splat.state matches 1 run title @a title [{text:"Data",color:"#e83d84",bold:true},{text:" WINS",color:"white",bold:true}]
execute if score ?winner splat.state matches 2 run title @a title [{text:"IT",color:"#cc99ff",bold:true},{text:" WINS",color:"white",bold:true}]
execute if score ?winner splat.state matches 0 run title @a title {text:"DRAW",color:"gray",bold:true}
execute if score ?winner splat.state matches 1..2 run title @a subtitle {text:"Most of the campus painted",color:"gray"}
execute if score ?winner splat.state matches 0 run tellraw @a {text:"Dead even. Neither team takes the series point.",color:"gray"}

# --- SUPERSTATE 3 -> 4 ---
execute if score ?winner splat.state matches 1 run return run function main:api/end_game_data
execute if score ?winner splat.state matches 2 run return run function main:api/end_game_it
function main:api/end_game
