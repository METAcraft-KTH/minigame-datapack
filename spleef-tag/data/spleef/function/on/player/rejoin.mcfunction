# ============================================================
# spleef:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Rejoining player
# ============================================================

tp @s @n[tag=spleef.tp.arena,type=marker]
gamemode spectator @s
tellraw @s {"text":"Welcome back. You will rejoin in the next round.","color":"gray"}