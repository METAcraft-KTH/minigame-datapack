# ============================================================
# walls:end/draw
# Called by: walls:end/timeout
# Executor:  Server
#
# Both sides on identical warden health at the time limit.
# ============================================================

title @a times 5 70 20
title @a title {text:"DRAW",color:"gray",bold:true}
tellraw @a {text:"Dead even. Nobody takes the win bonus.",color:"gray"}

function walls:end/finish
