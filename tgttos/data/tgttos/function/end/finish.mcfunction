# ============================================================
# tgttos:end/finish
# Called by: tgttos:end/win_data, win_it, draw
# Executor:  Server
#
# Tidy up everything this pack put into the world, then hand
# control back to MAIN.
# ============================================================

# hand MAIN's teams back the way we found them
team modify main.it friendlyFire true
team modify main.data friendlyFire true

# --- CLEAN UP ---
kill @e[type=minecraft:marker,tag=tgttos.point]
execute positioned 20000 64 60050 run kill @e[type=minecraft:arrow,distance=..400]
execute positioned 20000 64 60050 run kill @e[type=minecraft:item,distance=..400]
#   the permanent Regeneration would otherwise follow people into
#   the lobby and the next game
effect clear @a[tag=!admin]

bossbar set tgttos:data visible false
bossbar set tgttos:it visible false

#   matching tgttos:on/introstart. Not "remove all" — titlewriter
#   keeps chunk 0,0 force-loaded.
forceload remove 19940 59960 20060 60140

# The concrete both teams bridged with is left where it stands,
# the same way Walls leaves what its teams built. tgttos:map/setup
# rebuilds the control points and the platforms from scratch at the
# start of the next run, which is everything the game reads.

# --- SUPERSTATE 3 -> 4 ---
#   #winner tgttos.state is set by win_data / win_it / draw.
#   1 = Data, 2 = IT, 0 = draw (nobody takes the series point).
execute if score #winner tgttos.state matches 1 run return run function main:api/end_game_data
execute if score #winner tgttos.state matches 2 run return run function main:api/end_game_it
function main:api/end_game
