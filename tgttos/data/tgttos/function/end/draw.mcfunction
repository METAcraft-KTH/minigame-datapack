# ============================================================
# tgttos:end/draw
# Called by: tgttos:end/timeout
# Executor:  Server
#
# Both sides on identical objective time at the backstop.
# ============================================================

scoreboard players set ?over tgttos.state 1

title @a times 5 70 20
title @a title {text:"DRAW",color:"gray",bold:true}
tellraw @a {text:"Dead even. Neither team takes the series point.",color:"gray"}

# nobody takes the series point
scoreboard players set #winner tgttos.state 0

function tgttos:end/finish
