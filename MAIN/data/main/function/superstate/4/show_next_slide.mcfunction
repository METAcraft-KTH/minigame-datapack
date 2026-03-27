# ============================================================
# Called by: main:superstate/4/tick_slide (once per 10 seconds (aka per slide))
# Executor:  Server
# 
# Displays the next game leaderboard.
# UNFINISHED ATM
# 
# ============================================================

# --- CHECK HOW MANY SLIDES ARE LEFT ---
execute store result score ?slidecount main.temp run data get storage main:temp stats
#   if 0, do nothing - this will not dial back the timer, so the tick function proceeds
execute if score ?slidecount main.temp matches 0 run return 0
#   if not, proceed

# --- SHOW SLIDE (queue) ---
execute as @a at @s run playsound entity.item.pickup master @s ~ ~ ~ .6 1 1
tellraw @a [{text:"\n—————— ",color:"#E83D84"},{storage:"main:temp",nbt:"stats[0]",strikethrough:false,color:"yellow"}," ——————"]
tellraw @a ["1. ",{storage:"main:temp",nbt:"players[0].name",color:"yellow"}," - ",{storage:"main:temp",nbt:"stats[0].prefix"},{storage:"main:temp",nbt:"players[0].score",color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix"}]
tellraw @a ["2. ",{storage:"main:temp",nbt:"players[1].name",color:"yellow"}," - ",{storage:"main:temp",nbt:"stats[0].prefix"},{storage:"main:temp",nbt:"players[1].score",color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix"}]
tellraw @a ["3. ",{storage:"main:temp",nbt:"players[2].name",color:"yellow"}," - ",{storage:"main:temp",nbt:"stats[0].prefix"},{storage:"main:temp",nbt:"players[2].score",color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix"}]
tellraw @a ["4. ",{storage:"main:temp",nbt:"players[3].name",color:"yellow"}," - ",{storage:"main:temp",nbt:"stats[0].prefix"},{storage:"main:temp",nbt:"players[3].score",color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix"}]
tellraw @a ["5. ",{storage:"main:temp",nbt:"players[4].name",color:"yellow"}," - ",{storage:"main:temp",nbt:"stats[0].prefix"},{storage:"main:temp",nbt:"players[4].score",color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix"}]
tellraw @a ["6. ",{storage:"main:temp",nbt:"players[5].name",color:"yellow"}," - ",{storage:"main:temp",nbt:"stats[0].prefix"},{storage:"main:temp",nbt:"players[5].score",color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix"}]
tellraw @a ["7. ",{storage:"main:temp",nbt:"players[6].name",color:"yellow"}," - ",{storage:"main:temp",nbt:"stats[0].prefix"},{storage:"main:temp",nbt:"players[6].score",color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix"}]
tellraw @a ""
execute as @a run tellraw @s ["YOU: ",{storage:"main:temp",nbt:"stats[0].prefix"},{score:{name:"@s",objective:"main.temp.stat"},color:"aqua"},{storage:"main:temp",nbt:"stats[0].suffix"}]

# --- POP SLIDE AFTER DISPLAYING IT ---
data remove storage main:temp stats[0]

# --- DIAL TIMER BACK 10 SECONDS ---
scoreboard players remove ?supertimer main.time 200