# ============================================================
# exact:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Late join player
# ============================================================

execute if entity @s[tag=admin] run return 0
execute unless entity @s[tag=exact.registered] run function exact:register_new_player

gamemode spectator @s
tellraw @s {"text":"The game is already in progress. You are now spectating.","color":"yellow"}
