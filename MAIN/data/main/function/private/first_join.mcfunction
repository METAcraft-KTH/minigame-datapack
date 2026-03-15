# ============================================================
# Called by: _tick
# Executor:  Player who doesn't have an ID
# 
# Gives the player a unique ID, and calls rejoin
# if they joined in the middle of a game.
# 
# ============================================================

scoreboard players operation @s main.id = ! main.id
scoreboard players add ! main.id 1

# if they joined in the middle of a game, call rejoin
execute if score ?superstate main.state matches 3 run function main:private/call/rejoin
# latejoin will be called by _tick right after this regardless, since
# they lack the scoreboard score main.iwashere