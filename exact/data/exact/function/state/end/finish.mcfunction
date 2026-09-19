# ============================================================
# exact:state/end/finish
# Called by: exact:state/end/check
# Executor:  Server
# Reads: #winner exact.state (0 = nobody, 1 = Data, 2 = IT)
#
# Announces the side that outlasted the other, puts the players
# back the way we found them, and hands control back to MAIN.
# ============================================================

bossbar remove exact:timer

title @a clear
title @a times 5 70 20

execute if score #winner exact.state matches 1 run title @a title [{text:"Data",color:"#e83d84",bold:true},{text:" WINS",color:"white",bold:true}]
execute if score #winner exact.state matches 2 run title @a title [{text:"IT",color:"#cc99ff",bold:true},{text:" WINS",color:"white",bold:true}]
execute if score #winner exact.state matches 0 run title @a title {text:"NOBODY WINS",color:"gray",bold:true}

execute if score #winner exact.state matches 1..2 run title @a subtitle {text:"Last team standing",color:"gray"}
execute if score #winner exact.state matches 1..2 run tellraw @a ["",{text:"Still standing: ",color:"gray"},{selector:"@a[tag=!admin,tag=!exact.dead]",color:"green"}]
execute if score #winner exact.state matches 0 run tellraw @a {text:"Everybody ran out of hearts on the same round!",color:"gray"}

# --- CLEAN UP ---
# Undo the 5-heart cap and top everybody back up, so the next game in the
# lineup does not inherit half a health bar.
effect clear @a
execute as @a run attribute @s minecraft:max_health base reset
effect give @a minecraft:instant_health 1 10 true

tag @a remove exact.dead
tag @a remove exact.win

# --- SUPERSTATE 3 -> 4 ---
#   #winner exact.state was decided by exact:state/end/check.
#   1 = Data, 2 = IT, 0 = nobody (neither team takes the series point).
execute if score #winner exact.state matches 1 run return run function main:api/end_game_data
execute if score #winner exact.state matches 2 run return run function main:api/end_game_it
function main:api/end_game
