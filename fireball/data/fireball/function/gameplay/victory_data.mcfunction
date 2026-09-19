# ============================================================
# fireball:gameplay/victory_data
# Called by: fireball:gameplay/game_tick (once)
# Executor:  Server
# ============================================================

title @a clear
title @a times 10 80 20
title @a subtitle {text:"Forged in the fire of the fortress.",color:"gray",italic:true}
title @a title [{text:"Data",color:"#e83d84",bold:true},{text:" WINS",color:"white",bold:true}]
tellraw @a [{text:"Data",color:"#e83d84",bold:true},{text:" is the last team standing!",color:"white"}]
execute as @a at @s run playsound minecraft:entity.blaze.death voice @s ~ ~ ~ 1 0.7

function fireball:api/game_ended
