# ============================================================
# Called by: main:superstate/4/show_next_slide (once per slide)
# Executor:  Every player
# 
# Shows the last content row of the slide: the player's own score.
# 
# ============================================================

execute unless score @s main.temp.stat matches -2147483648.. run return run tellraw @s ["You: ",{text:"—",color:"gray"}]

scoreboard players operation #ticks main.temp = @s main.temp.stat
function main:superstate/4/slide/format
tellraw @s ["You: ",{storage:"main:temp",nbt:"stats[0].prefix",interpret:true},{storage:"main:temp",nbt:"formatted",interpret:true,color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix",interpret:true}]
