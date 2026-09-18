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
tellraw @a {text:"Dead even. Nobody takes the win bonus.",color:"gray"}

function tgttos:end/finish
