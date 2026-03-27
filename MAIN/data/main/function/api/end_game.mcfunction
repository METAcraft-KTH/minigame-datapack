# ============================================================
# Called by: The minigame, when the game ends.
#
# Set everyone to spectator and set superstate to 4.
# 
# ============================================================

# just in case someone calls this by accident
execute unless score ?superstate main.state matches 3 run return 0


title @a times 0 60 40
title @a title {text:"GAME!",color:"red",bold:true}
title @a subtitle ""


# --- BEGIN SUPERSTATE 4 ---
scoreboard players set ?supertimer main.time 0
scoreboard players set ?superstate main.state 4