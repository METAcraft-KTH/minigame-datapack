# ============================================================
# fireball:gameplay/victory_it
# Called by: fireball:gameplay/game_tick (once)
# Executor:  Server
# ============================================================

title @a clear
title @a times 10 80 20
title @a subtitle {text:"Carved in blackstone.",color:"gray",italic:true}
title @a title [{text:"IT",color:"#cc99ff",bold:true},{text:" WINS",color:"white",bold:true}]
tellraw @a [{text:"IT",color:"#cc99ff",bold:true},{text:" is the last team standing!",color:"white"}]
execute as @a at @s run playsound minecraft:entity.iron_golem.death voice @s ~ ~ ~ 1 0.6

function fireball:api/game_ended
