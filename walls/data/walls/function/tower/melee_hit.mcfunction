# ============================================================
# walls:tower/melee_hit
# Called by: walls:tower/melee
# Executor:  One tower, at its own position
#
# Macro args: {team:"main.data"} — the side it is hostile to
#
# ### TUNING ### 15 damage to everything within 5 blocks, every 30
# ticks. The radius is wide because a ravager scaled to 2.0 is nearly 4
# blocks across on its own. A raised shield still blocks this, the same
# as it would a real ravager's swing.
# Players in creative or spectator are ignored on purpose, so admins
# can stand next to one and look at it.
# ============================================================

$execute unless entity @a[team=$(team),gamemode=survival,distance=..5] run return 0

$damage @a[team=$(team),gamemode=survival,distance=..5] 15 minecraft:mob_attack by @s
playsound minecraft:entity.ravager.attack hostile @a[distance=..32] ~ ~ ~ 1 0.8
