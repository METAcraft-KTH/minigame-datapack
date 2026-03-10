# ============================================================
# Called by: _tick
# Executor:  Player who doesn't have an ID
# 
# Gives the player a unique ID.
# 
# ============================================================

scoreboard players operation @s main.id = ! main.id
scoreboard players add ! main.id 1

# TODO: tellraw to welcome the player