# ============================================================
# Called by: main:superstate/4/show_next_slide (once per slide)
# Executor:  Server
# 
# Get the scores to be displayed, sort them,
# and put them into the storage.
# 
# ============================================================

# --- FIND BIGGEST/SMALLEST VALUE (DEPENDING ON SORT) ---
#   only calculate if the number is actually set (so we dont accidentally set the top to 0)
$execute as @a if score @s $(objective) matches -2147483648..2147483647 run scoreboard players operation ! main.temp $(sortby) @s $(objective)

# --- EACH PLAYER GET THEIR OWN NUMBER TO DISPLAY ---
#   unused for now
$execute as @a run scoreboard players operation @s main.temp.stat = @s $(objective)