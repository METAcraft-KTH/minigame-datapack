# ============================================================
# Called by: main:superstate/4/tick_slide (once per 10 seconds (aka per slide))
# Executor:  Server
# 
# Displays the next game leaderboard.
# UNFINISHED ATM
# 
# ============================================================

# --- CHECK HOW MANY SLIDES ARE LEFT ---
execute store result score ?slidecount main.temp run data get storage main:temp howtoplay
#   if 0, do nothing - this will not dial back the timer, so the tick function proceeds
execute if score ?slidecount main.temp matches 0 run return 0
#   if not, proceed

# --- SHOW SLIDE (queue) ---
execute as @a at @s run playsound entity.item.pickup master @s ~ ~ ~ .6 1 1
tellraw @a [{text:"—————— ",color:"#E83D84"},{storage:"main:temp",nbt:"stats[0]",strikethrough:false}," ——————"]
#tellraw @a {storage:"main:temp",nbt:"howtoplay[0][0]",interpret:true}
#tellraw @a {storage:"main:temp",nbt:"howtoplay[0][1]",interpret:true}
#tellraw @a {storage:"main:temp",nbt:"howtoplay[0][2]",interpret:true}
#tellraw @a {storage:"main:temp",nbt:"howtoplay[0][3]",interpret:true}
#tellraw @a {storage:"main:temp",nbt:"howtoplay[0][4]",interpret:true}
#tellraw @a {storage:"main:temp",nbt:"howtoplay[0][5]",interpret:true}

# --- POP SLIDE AFTER DISPLAYING IT ---
data remove storage main:temp stats[0]

# --- DIAL TIMER BACK 10 SECONDS ---
scoreboard players remove ?supertimer main.time 200