# ============================================================
# race:on/player/rejoin
# Called by: main:private/call/rejoin (player reconnects)
# Executor:  Player who reconnected
# ============================================================
# Restore player state when they rejoin.

execute if score @s race.checkpoint matches 1.. run gamemode adventure @s
execute if score @s race.checkpoint matches ..0 run gamemode spectator @s
execute if tag @s race.finished run gamemode spectator @s
