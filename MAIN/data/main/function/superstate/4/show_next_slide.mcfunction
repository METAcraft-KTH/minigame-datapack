# ============================================================
# Called by: main:superstate/4/tick (once per 10 seconds (aka per slide))
# Executor:  Server
# 
# Displays the next game leaderboard.
# Same layout as the howtoplay slides in superstate 2:
#   separator, name, blank, top 5 players, your own score, separator
# 
# ============================================================

# --- CHECK HOW MANY SLIDES ARE LEFT ---
execute store result score ?slidecount main.temp run data get storage main:temp stats
#   if 0, do nothing - this will not dial back the timer, so the tick function will continue
execute if score ?slidecount main.temp matches 0 run return 0
#   if not, proceed

# --- RANK PLAYERS AND BUILD THE TOP 5 ROWS ---
function main:superstate/4/slide/rank with storage main:temp stats[0]

# --- SHOW SLIDE ---
execute as @a at @s run playsound entity.item.pickup master @s ~ ~ ~ .6 1 1
tellraw @a {text:"——————————————————————————————",color:"#E83D84",strikethrough:true}
tellraw @a {storage:"main:temp",nbt:"stats[0].name",interpret:true,color:"yellow",bold:true}
tellraw @a ""
#   missing rows (less than 5 players with a score) show up as blank lines
tellraw @a {storage:"main:temp",nbt:"rows[0]",interpret:true}
tellraw @a {storage:"main:temp",nbt:"rows[1]",interpret:true}
tellraw @a {storage:"main:temp",nbt:"rows[2]",interpret:true}
tellraw @a {storage:"main:temp",nbt:"rows[3]",interpret:true}
tellraw @a {storage:"main:temp",nbt:"rows[4]",interpret:true}
execute as @a run function main:superstate/4/slide/show_own_score
tellraw @a {text:"——————————————————————————————",color:"#E83D84",strikethrough:true}

# --- POP SLIDE AFTER DISPLAYING IT ---
data remove storage main:temp stats[0]

# --- DIAL TIMER BACK 10 SECONDS ---
scoreboard players remove ?supertimer main.time 200
