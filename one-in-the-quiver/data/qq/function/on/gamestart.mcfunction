# ============================================================
# qq:on/gamestart
# Called by: MAIN when superstate changes to 3
# Executor: Server
# ============================================================

# Optional external init hook
#function #qq:init

# Reset mode sequence at the start of this minigame
scoreboard players set mode qq.config 0

# Reset per-match counters
scoreboard players set #num20kills qq.Points 0
scoreboard players set @a[tag=!admin] qq.time_alive 200
scoreboard players set @a[tag=!admin] qq.in_state 0
tag @a remove qq.dead

# Start gameplay loop at pregame phase
function qq:states/pregame/start
