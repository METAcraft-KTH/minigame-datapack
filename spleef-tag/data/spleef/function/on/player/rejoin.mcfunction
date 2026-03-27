# ============================================================
# spleef:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Rejoining player
# ============================================================

effect clear @s
clear @s
experience set @s 0 levels
experience set @s 0 points

tp @s 30024 50 50024
gamemode spectator @s
tellraw @s {"text":"Welcome! You joined in the middle of a game. Stick around to play in the next round.\n","color":"gray"}