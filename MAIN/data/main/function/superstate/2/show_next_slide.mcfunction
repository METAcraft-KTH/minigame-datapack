# ============================================================
# Called by: main:superstate/2/tick_slide (once per 10 seconds (aka per slide))
# Executor:  Server
# 
# Displays the next slide of howtoplay text.
# If there are no more slides to display, go to state 3.
# 
# ============================================================

# --- CHECK HOW MANY SLIDES ARE LEFT ---
execute store result score ?slidecount main.temp run data get storage main:temp howtoplay
#   if 0, stop and end state
execute if score ?slidecount main.temp matches 0 run return run function main:superstate/2/go_to_state_3
#   if not, proceed

# --- SHOW SLIDE (queue) ---
execute as @a at @s run playsound entity.item.pickup master @s ~ ~ ~ .6 1 1
tellraw @a {text:"——————————————————————————————",color:"#E83D84",strikethrough:true}
tellraw @a ""
tellraw @a {storage:"main:temp",nbt:"howtoplay[0][0]",interpret:true}
tellraw @a {storage:"main:temp",nbt:"howtoplay[0][1]",interpret:true}
tellraw @a {storage:"main:temp",nbt:"howtoplay[0][2]",interpret:true}
tellraw @a {storage:"main:temp",nbt:"howtoplay[0][3]",interpret:true}
tellraw @a {storage:"main:temp",nbt:"howtoplay[0][4]",interpret:true}
tellraw @a {storage:"main:temp",nbt:"howtoplay[0][5]",interpret:true}
tellraw @a ""
tellraw @a {text:"——————————————————————————————",color:"#E83D84",strikethrough:true}

# --- POP SLIDE AFTER DISPLAYING IT ---
data remove storage main:temp howtoplay[0]