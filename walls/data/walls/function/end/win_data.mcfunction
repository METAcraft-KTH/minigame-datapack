# ============================================================
# walls:end/win_data
# Called by: walls:tower/tick (once)
# Executor:  Server
#
# IT lost both ravagers.
# ============================================================

title @a times 5 70 20
title @a title [{text:"Data",color:"#e83d84",bold:true},{text:" WINS",color:"white",bold:true}]
title @a subtitle {text:"Both IT ravagers are down",color:"gray"}
tellraw @a [{text:"Data",color:"#e83d84",bold:true},{text:" wins — both IT ravagers are down!",color:"white"}]

# tells walls:end/finish which main:api/end_game_* to hand off to
scoreboard players set #winner walls.state 1

function walls:end/finish
