# ============================================================
# exact:state/ingame_task/tick
# Called every tick during task phase
# Check for winners and advance timer
# (20 seconds = 400 ticks)
# ============================================================

# Update title for players who have won (show "SUCCESS")
execute as @a[tag=exact.win] run title @s actionbar {"text":"SUCCESS","color":"green","bold":true}

# Check if task duration (400 ticks) has passed
execute if score ?phase_timer exact.timer matches 400.. run function exact:state/ingame_task/exit
