# ============================================================
# race:on/player/death
# Called by: main:private/call/death (on player death)
# Executor:  Player who died
# ============================================================
# Handle player death during the race.

scoreboard players set @s race.checkpoint -1
gamemode spectator @s
tag @s remove race.playing
