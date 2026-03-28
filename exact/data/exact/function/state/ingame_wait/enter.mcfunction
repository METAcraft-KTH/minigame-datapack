# ============================================================
# exact:state/ingame_wait/enter
# Called once when entering the wait phase
# Show results and award points (10 seconds = 200 ticks)
# ============================================================

title @a times 0 60 40
title @a[tag=exact.win] title {"text":"SUCCESS","color":"green","bold":true}
title @a[tag=!exact.win] title {"text":"FAILURE","color":"red","bold":true}

# Players with exact.win tag see nothing (already showed SUCCESS)
# Award points to winners
execute as @a[tag=exact.win] run scoreboard players add @s exact.stats.wins 1

# Reset phase timer
scoreboard players set ?phase_timer exact.timer 0
