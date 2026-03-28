# ============================================================
# mingle:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Player who joined after game start
# ============================================================

gamemode spectator @s
tag @s remove mingle.in_cp
tag @s remove mingle.correct
tag @s add mingle.loser
tellraw @s {"text":"A Mingle match is already in progress. You are spectating.","color":"yellow"}
