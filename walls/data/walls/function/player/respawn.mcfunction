# ============================================================
# walls:player/respawn
# Called by: walls:player/tick_dead
# Executor:  The player coming back
#
# No items are handed out here — see walls:player/setup.
# ============================================================

scoreboard players reset @s walls.respawn
gamemode survival @s
function walls:player/send_to_spawn
title @s actionbar {text:"Go!",color:"green"}
execute at @s run playsound entity.player.levelup master @s ~ ~ ~ 1 1.4
