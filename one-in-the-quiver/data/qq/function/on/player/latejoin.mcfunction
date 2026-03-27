# ============================================================
# qq:on/player/latejoin
# Called by: MAIN when a player joins mid-game
# Executor: Late-joining player
# ============================================================

gamemode spectator @s
tellraw @s {"text":"The game is already in progress. You are now spectating.","color":"yellow"}
