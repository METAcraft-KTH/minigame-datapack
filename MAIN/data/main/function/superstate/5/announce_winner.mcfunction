# ============================================================
# Called by: main:superstate/4/go_to_state_5 (scheduled, 2s later)
# Executor:  Server
#
# Declares the best-of-5 winner, after the screen wipe that
# go_to_state_5 puts up has had time to clear.
# ============================================================

function main:util/show_standings

title @a times 10 120 20
title @a subtitle ""
execute if score ?wins_data main.state > ?wins_it main.state run title @a title [{text:"Data",color:"#e83d84",bold:true},{text:" WINS",color:"white",bold:true}]
execute if score ?wins_it main.state > ?wins_data main.state run title @a title [{text:"IT",color:"#cc99ff",bold:true},{text:" WINS",color:"white",bold:true}]
execute if score ?wins_data main.state = ?wins_it main.state run title @a title {text:"DRAW",color:"gray",bold:true}

execute as @a at @s run playsound minecraft:ui.toast.challenge_complete master @s ~ ~ ~ 1 1
