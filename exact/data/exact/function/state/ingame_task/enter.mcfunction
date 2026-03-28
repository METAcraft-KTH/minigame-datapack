# ============================================================
# exact:state/ingame_task/enter
# Called once when entering the task phase
# Set up the task for the current round (20 seconds = 400 ticks)
# Display task instructions in subtitle
# ============================================================

# Clear titles
title @a clear

# Set subtitle to task description (will be per-round)
# This is a placeholder; update per round as needed
execute if score ?round exact.state matches 1 run subtitle @a {"text":"Round 1: Complete your task!","color":"green"}
execute if score ?round exact.state matches 2 run subtitle @a {"text":"Round 2: Complete your task!","color":"green"}
execute if score ?round exact.state matches 3 run subtitle @a {"text":"Round 3: Complete your task!","color":"green"}
execute if score ?round exact.state matches 4 run subtitle @a {"text":"Round 4: Complete your task!","color":"green"}
execute if score ?round exact.state matches 5 run subtitle @a {"text":"Round 5: Complete your task!","color":"green"}
execute if score ?round exact.state matches 6 run subtitle @a {"text":"Round 6: Complete your task!","color":"green"}
execute if score ?round exact.state matches 7 run subtitle @a {"text":"Round 7: Complete your task!","color":"green"}
execute if score ?round exact.state matches 8 run subtitle @a {"text":"Round 8: Complete your task!","color":"green"}
execute if score ?round exact.state matches 9 run subtitle @a {"text":"Round 9: Complete your task!","color":"green"}
execute if score ?round exact.state matches 10 run subtitle @a {"text":"Round 10: Complete your task!","color":"green"}
execute if score ?round exact.state matches 11 run subtitle @a {"text":"Round 11: Complete your task!","color":"green"}
execute if score ?round exact.state matches 12 run subtitle @a {"text":"Round 12: Complete your task!","color":"green"}
execute if score ?round exact.state matches 13 run subtitle @a {"text":"Round 13: Complete your task!","color":"green"}
execute if score ?round exact.state matches 14 run subtitle @a {"text":"Round 14: Complete your task!","color":"green"}
execute if score ?round exact.state matches 15 run subtitle @a {"text":"Round 15: Complete your task!","color":"green"}
execute if score ?round exact.state matches 16 run subtitle @a {"text":"Round 16: Complete your task!","color":"green"}

# Initialize blank title (no text shown, but players who win will see "SUCCESS")
title @a {"text":"","fallback":""}

# Reset win tags from previous round
tag @a remove exact.win

# Reset phase timer
scoreboard players set ?phase_timer exact.timer 0

# ============================================================
# PLACEHOLDER: Task-specific command sections
# For each round, add your task validation logic here
# These are examples; replace with actual task implementations
# ============================================================

# Round 1 task logic (if needed for server-side checks)
execute if score ?round exact.state matches 1 run say Round 1 started!

# Round 2 task logic
execute if score ?round exact.state matches 2 run say Round 2 started!

# Round 3 task logic
execute if score ?round exact.state matches 3 run say Round 3 started!

# Round 4 task logic
execute if score ?round exact.state matches 4 run say Round 4 started!

# Round 5 task logic
execute if score ?round exact.state matches 5 run say Round 5 started!

# Round 6 task logic
execute if score ?round exact.state matches 6 run say Round 6 started!

# Round 7 task logic
execute if score ?round exact.state matches 7 run say Round 7 started!

# Round 8 task logic
execute if score ?round exact.state matches 8 run say Round 8 started!

# Round 9 task logic
execute if score ?round exact.state matches 9 run say Round 9 started!

# Round 10 task logic
execute if score ?round exact.state matches 10 run say Round 10 started!

# Round 11 task logic
execute if score ?round exact.state matches 11 run say Round 11 started!

# Round 12 task logic
execute if score ?round exact.state matches 12 run say Round 12 started!

# Round 13 task logic
execute if score ?round exact.state matches 13 run say Round 13 started!

# Round 14 task logic
execute if score ?round exact.state matches 14 run say Round 14 started!

# Round 15 task logic
execute if score ?round exact.state matches 15 run say Round 15 started!

# Round 16 task logic
execute if score ?round exact.state matches 16 run say Round 16 started!
