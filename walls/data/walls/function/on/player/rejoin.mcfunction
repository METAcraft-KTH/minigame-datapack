# ============================================================
# walls:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Player who reconnected
#
# INCLUDING first-time joiners — those are handled by
# walls:on/player/latejoin instead, which MAIN calls right after.
# ============================================================

execute unless score @s main.iwashere matches 1 run return 0

# put them back in whatever state they disconnected in
execute if score @s walls.respawn matches 1.. run gamemode spectator @s
execute unless score @s walls.respawn matches 1.. run gamemode survival @s
# (they keep the position they logged out at — no teleport back to spawn)

function walls:player/set_spawnpoints
bossbar set walls:it players @a
bossbar set walls:data players @a
bossbar set walls:timer players @a
