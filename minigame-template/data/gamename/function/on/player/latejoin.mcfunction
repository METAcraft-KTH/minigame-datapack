# ============================================================
# Called by: main:private/call/latejoin
# Executor:  Player who joined the server after game start
# 
# Triggers on late join in the middle of a game.
# Generally a good idea to fill them in on how the
# game works using tellraw, or boot them
# to spectator if it's an elimination-type game.
# 
# ============================================================

gamemode spectator @s
tellraw @s {"text":"A match is already in progress. You are spectating until the next minigame.","color":"yellow"}