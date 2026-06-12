# ============================================================
# Called by: main:superstate/0/tick (once)
# Executor:  Server
# 
# Runs ONCE, when there are enough players online.
# Change superstate from 0 to 1.
# 
# ============================================================


# --- SET VARS ---

# game 1
scoreboard players set ?minigame_id main.state 1
# 12 minutes till start
scoreboard players operation ?supertimer main.time = ?before_first_minigame_wait_time main.const
execute store result bossbar main:timer max run scoreboard players get ?before_first_minigame_wait_time main.const

# --- BEGIN SUPERSTATE 1 ---
execute as @a run function main:private/stop_cutscene
scoreboard players set ?superstate main.state 1
setworldspawn 0 64 50000