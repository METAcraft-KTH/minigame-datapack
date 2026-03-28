# ============================================================
# exact:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Player who joined after game start
#
# Handle players who join mid-game (not present at game start).
# ============================================================

# Send to spectator
#gamemode spectator @s
#tellraw @s {"text":"The game is already in progress. You are now spectating.","color":"yellow"}
