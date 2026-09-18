# ============================================================
# walls:spawner/place
# Called by: walls:spawner/step
# Executor:  The placing player, positioned on the spawner block
#
# Macro args: storage walls:spawner pending
#   spawn - the SpawnData compound, mob and custom_spawn_rules
#   min   - MinSpawnDelay
#   max   - MaxSpawnDelay
#
# setblock rather than a run of data modify: one command, and a
# freshly placed spawner holds nothing worth keeping. The
# custom_spawn_rules inside SpawnData are what let these run at
# any light level.
# ============================================================

$setblock ~ ~ ~ minecraft:spawner{SpawnData:$(spawn),MinSpawnDelay:$(min),MaxSpawnDelay:$(max),SpawnCount:2,MaxNearbyEntities:6,RequiredPlayerRange:16,SpawnRange:4} replace

# the only confirmation the player gets that it came out armed —
# @s, not @a, so it does not announce the spawner to the other side
playsound block.respawn_anchor.charge block @s ~ ~ ~ 0.6 1.4
