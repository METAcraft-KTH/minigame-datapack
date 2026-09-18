# ============================================================
# tgttos:cap/actionbar_prep
# Called by: tgttos:cap/tick
# Executor:  Server
#
# Turns the two signed progress bars into two percentages plus
# the colours to print them in, then hands the colours to the
# macro below. The numbers stay as live score components so the
# macro only ever recompiles when a colour actually changes —
# nine possible combinations, all cached.
#
#   ■  owner of the point, grey until somebody takes it
#   %  progress, in the colour of whoever is currently gaining
# ============================================================

# --- PERCENTAGES ---
#   200 ticks of progress is 100%, in either direction
scoreboard players operation #pct1 tgttos.temp = ?prog1 tgttos.state
execute if score #pct1 tgttos.temp matches ..-1 run scoreboard players operation #pct1 tgttos.temp *= #-1 main.const
scoreboard players operation #pct1 tgttos.temp /= #2 main.const
scoreboard players operation #pct2 tgttos.temp = ?prog2 tgttos.state
execute if score #pct2 tgttos.temp matches ..-1 run scoreboard players operation #pct2 tgttos.temp *= #-1 main.const
scoreboard players operation #pct2 tgttos.temp /= #2 main.const

# --- COLOURS ---
data modify storage tgttos:ui c1 set value "gray"
execute if score ?prog1 tgttos.state matches 1.. run data modify storage tgttos:ui c1 set value "#e83d84"
execute if score ?prog1 tgttos.state matches ..-1 run data modify storage tgttos:ui c1 set value "#cc99ff"
data modify storage tgttos:ui c2 set value "gray"
execute if score ?prog2 tgttos.state matches 1.. run data modify storage tgttos:ui c2 set value "#e83d84"
execute if score ?prog2 tgttos.state matches ..-1 run data modify storage tgttos:ui c2 set value "#cc99ff"
data modify storage tgttos:ui o1 set value "dark_gray"
execute if score ?own1 tgttos.state matches 1 run data modify storage tgttos:ui o1 set value "#e83d84"
execute if score ?own1 tgttos.state matches 2 run data modify storage tgttos:ui o1 set value "#cc99ff"
data modify storage tgttos:ui o2 set value "dark_gray"
execute if score ?own2 tgttos.state matches 1 run data modify storage tgttos:ui o2 set value "#e83d84"
execute if score ?own2 tgttos.state matches 2 run data modify storage tgttos:ui o2 set value "#cc99ff"

function tgttos:cap/actionbar with storage tgttos:ui
