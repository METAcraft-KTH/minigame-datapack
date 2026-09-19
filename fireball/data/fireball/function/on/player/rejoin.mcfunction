# ============================================================
# fireball:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Player who reconnected
#
# INCLUDING first-time joiners — those are handled by
# fireball:on/player/latejoin instead, which MAIN calls right after.
# ============================================================

execute unless score @s main.iwashere matches 1 run return 0
execute if entity @s[tag=admin] run return 0

# The fireball only chases players the valid_target predicate
# accepts, and that predicate reads their gamemode — so a player
# who comes back in the wrong mode is either invisible to the ball
# or hunted after being eliminated. Put them back where they were.
execute if entity @s[tag=fireball.alive] run function fireball:gameplay/init_player
execute unless entity @s[tag=fireball.alive] run function fireball:gameplay/on_death
