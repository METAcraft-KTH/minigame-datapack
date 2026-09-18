# ============================================================
# walls:golem/melee_hit
# Called by: walls:golem/melee
# Executor:  One defending golem, at its own position
#
# Macro args: {team:"main.data"} — the side it is hostile to
#
# ### TUNING ### 15 damage through armour to everything within 4.5
# blocks, every 30 ticks. The radius is wide because these golems are
# scaled to 2.0, so their hitbox alone is nearly 3 blocks across.
# Players in creative or spectator are ignored on purpose, so admins
# can stand next to one and look at it.
# ============================================================

$execute unless entity @a[team=$(team),gamemode=survival,distance=..4.5] run return 0

$damage @a[team=$(team),gamemode=survival,distance=..4.5] 15 minecraft:mob_attack by @s
playsound minecraft:entity.iron_golem.attack hostile @a[distance=..32] ~ ~ ~ 1 0.8
