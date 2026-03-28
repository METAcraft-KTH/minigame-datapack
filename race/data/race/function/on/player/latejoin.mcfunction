# ============================================================
# race:on/player/latejoin
# Called by: main:private/call/latejoin (player joins mid-game)
# Executor:  Player who joined after game start
# ============================================================
# Handle late joiners to the race.

gamemode spectator @s
tellraw @s {"text":"The race is already in progress. You are now spectating.","color":"yellow"}
