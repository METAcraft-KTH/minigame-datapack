# ============================================================
# Called by: main:superstate/2/tick (once)
# Executor:  Server
# 
# Runs ONCE, when supertimer is 0 and the superstate
# changes from 2 to 3.
# 
# ============================================================

# --- STOP WATCHING CUTSCENE ---
#   but admin get to stay in spectator mode tho
kill @e[type=block_display,tag=main.camera]
execute as @a[tag=!admin] run gamemode adventure
tellraw @a {text:"Get ready to begin...",color:"yellow",italic:true}
function main:superstate/2/macro_tp with storage main:temp

# --- CALL GAMESTART ---
function main:private/call/gamestart

# --- BEGIN SUPERSTATE 3 ---
scoreboard players set ?superstate main.state 3