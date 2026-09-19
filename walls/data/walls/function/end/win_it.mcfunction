# ============================================================
# walls:end/win_it
# Called by: walls:tower/tick (once)
# Executor:  Server
#
# Data lost both ravagers.
# ============================================================

title @a times 5 70 20
title @a title [{text:"IT",color:"#cc99ff",bold:true},{text:" WINS",color:"white",bold:true}]
title @a subtitle {text:"Both Data ravagers are down",color:"gray"}
tellraw @a [{text:"IT",color:"#cc99ff",bold:true},{text:" wins — both Data ravagers are down!",color:"white"}]

# tells walls:end/finish which main:api/end_game_* to hand off to
scoreboard players set #winner walls.state 2

function walls:end/finish
