# ============================================================
# exact:state/ingame_task/tick
# Called every tick during task phase
# Check for winners and advance timer
# (20 seconds = 400 ticks)
# ============================================================

title @a times 0 20 0
title @a[tag=!exact.win] title ""

# Update title for players who have won (show "SUCCESS")
title @a[tag=exact.win] title {"text":"SUCCESS","color":"green","bold":true}

# Check if task duration (400 ticks) has passed
execute if score ?phase_timer exact.timer matches 400.. run function exact:state/ingame_task/exit
