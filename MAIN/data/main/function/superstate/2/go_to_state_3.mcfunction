# ============================================================
# Called by: main:superstate/2/tick (once)
# Executor:  Server
# 
# Runs ONCE, when supertimer is 0 and the superstate
# changes from 2 to 3.
# 
# ============================================================

# --- CALL GAMESTART ---
function main:private/call/gamestart

# --- BEGIN SUPERSTATE 3 ---
scoreboard players set ?superstate main.state 3