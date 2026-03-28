# ============================================================
# Called by: main:private/call/latejoin
# Executor:  Player who joined the server after game start
# 
# Triggers on late join in the middle of a game.
# Generally a good idea to fill them in on how the
# game works using tellraw, or boot them
# to spectator if it's an elimination-type game.
# 
# ============================================================
say latejoin
gamemode spectator @s
tag @a[tag=uhc.latejoin] remove uhc.latejoin
tag @s add uhc.latejoin
execute as @e[tag=uhc.arena.battlebus] if score @s uhc.arena = ?round uhc.state run tp @a[tag=uhc.latejoin] @s
tag @s remove uhc.latejoin
