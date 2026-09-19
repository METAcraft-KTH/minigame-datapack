# ============================================================
# walls:end/draw
# Called by: walls:end/timeout
# Executor:  Server
#
# Both sides on identical ravager health at the time limit.
# ============================================================

title @a times 5 70 20
title @a title {text:"DRAW",color:"gray",bold:true}
tellraw @a {text:"Dead even. Neither team takes the series point.",color:"gray"}

# nobody takes the series point
scoreboard players set #winner walls.state 0

function walls:end/finish
