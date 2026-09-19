# ============================================================
# fireball:gameplay/on_death
# Called by: fireball:on/player/death, fireball:on/player/rejoin
# Executor:  Player who is out
#
# Idempotent — a player who reconnects after being eliminated
# runs this again.
#
# Their fireball.st.alive stops climbing the moment they leave
# adventure mode, because game_tick counts by the same
# valid_target predicate the fireball hunts with.
# ============================================================

tag @s remove fireball.alive

gamemode spectator @s

# warn-off target-selector-no-dimension
tp @s @n[tag=fireball.arena_center,type=marker]
