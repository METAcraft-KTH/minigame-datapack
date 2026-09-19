# ============================================================
# fireball:gameplay/game_over
# Called by: fireball:gameplay/game_tick (once)
# Executor:  Server
#
# Nobody is left alive at all — either a mutual wipe, or the
# last two went in together. Nobody wins.
# ============================================================

title @a clear
title @a times 10 70 20
title @a subtitle {text:"Everybody went in the lava.",color:"gray",italic:true}
title @a title {text:"GAME OVER",color:"dark_red",bold:true}
tellraw @a {text:"Nobody is left standing. It's a draw.",color:"gray"}
execute as @a at @s run playsound minecraft:entity.wither.death master @s ~ ~ ~ 1 0.5

# nobody takes the series point
scoreboard players set #winner fireball 0

function fireball:api/game_ended
