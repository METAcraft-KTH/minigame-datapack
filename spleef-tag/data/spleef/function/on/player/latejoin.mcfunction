# ============================================================
# spleef:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Late join player
# ============================================================

tp @s @n[tag=spleef.tp.arena,type=marker]
gamemode spectator @s
tellraw @s {"text":"The game is in progress. You are spectating this round.","color":"yellow"}