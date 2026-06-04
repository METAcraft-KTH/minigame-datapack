# ============================================================
# tnttag:state/ingame_wait/tick
# Called every tick during wait phase
# Count down and check for phase transition
# (10 seconds = 200 ticks)
# ============================================================

# Check if wait duration (200 ticks) has passed
execute if score ?phase_timer tnttag.timer matches 120.. run return run function tnttag:state/ingame_wait/exit

#effect give @a[tag=!admin] resistance 1 4 true
# countdown
bossbar set tnttag:red visible false
bossbar set tnttag:blue visible false
bossbar set tnttag:white players @a
bossbar set tnttag:white color white
bossbar set tnttag:white name "Preparing for the next bomb..."
bossbar set tnttag:white max 120
execute store result bossbar tnttag:white value run scoreboard players get ?phase_timer tnttag.timer

execute if score ?phase_timer tnttag.timer matches 5 run function tnttag:state/ingame_wait/give_out_points