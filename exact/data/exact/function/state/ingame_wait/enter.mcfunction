# ============================================================
# exact:state/ingame_wait/enter
# Called once when entering the wait phase
# Show results and award points (10 seconds = 200 ticks)
# ============================================================

# Clear titles
title @a clear

# Show "FAILURE" to players WITHOUT the exact.win tag
execute as @a[tag=!exact.win] run title @s {"text":"FAILURE","color":"red","bold":true}

# Players with exact.win tag see nothing (already showed SUCCESS)
# Award points to winners
execute as @a[tag=exact.win] run scoreboard players add @s exact.stats.wins 1

# Reset phase timer
scoreboard players set ?phase_timer exact.timer 0
