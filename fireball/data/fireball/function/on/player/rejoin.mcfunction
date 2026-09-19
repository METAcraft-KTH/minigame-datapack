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
#   an alive player reconnects wherever they logged out, which is
#   already the arena, so only the gamemode and bat need restoring.
execute if entity @s[tag=fireball.alive] run function fireball:gameplay/init_player
#   on_death teleports to the centre marker, which is a nether-scoped
#   @n lookup, so it needs the dimension handed to it.
execute unless entity @s[tag=fireball.alive] in minecraft:the_nether run function fireball:gameplay/on_death
