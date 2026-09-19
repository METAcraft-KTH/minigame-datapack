# ============================================================
# tgttos:end/win_it
# Called by: tgttos:objective/tick, tgttos:end/timeout (once)
# Executor:  Server
# ============================================================

scoreboard players set ?over tgttos.state 1

title @a times 5 70 20
title @a title [{text:"IT",color:"#cc99ff",bold:true},{text:" WINS",color:"white",bold:true}]
title @a subtitle {text:"They crossed that bridge",color:"gray"}
tellraw @a [{text:"IT",color:"#cc99ff",bold:true},{text:" ran the clock out holding both points!",color:"white"}]

# tells tgttos:end/finish which main:api/end_game_* to hand off to
scoreboard players set #winner tgttos.state 2

function tgttos:end/finish
