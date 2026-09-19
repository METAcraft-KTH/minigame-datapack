# ============================================================
# splat:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Player who joined the server after game start
# ============================================================

gamemode spectator @s
tellraw @s {"text":"Paint the Campus is already in progress. You are spectating until the next minigame.","color":"yellow"}
