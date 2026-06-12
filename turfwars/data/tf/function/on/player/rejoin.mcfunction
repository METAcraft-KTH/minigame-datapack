# ============================================================
# tf:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Player who rejoined the server
# ============================================================

execute unless score @s main.iwashere matches 1 run return 0

execute if score ?phase tf.state matches 1 as @s[tag=!admin] run gamemode adventure
execute unless score ?phase tf.state matches 1 as @s[tag=!admin] run gamemode spectator
