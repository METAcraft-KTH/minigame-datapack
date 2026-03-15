# ============================================================
# Called by: main:superstate/4/tick (once, on superstate end)
# Executor:  Server
# 
# Runs when we're going back to lobby (and no more games are left)
# 
# ============================================================

# reapply the title with a different timing, since the lagspike is over
title @a times 0 20 20
title @a title {"text":"ABA","font":"hexathlon:font","shadow_color":0}


# --- BEGIN SUPERSTATE 5 ---
scoreboard players set ?superstate main.state 5