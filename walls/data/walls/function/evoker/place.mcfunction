# ============================================================
# walls:evoker/place
# Called by: walls:state/fight/enter, walls:evoker/tick
# Executor:  Server
#
# The mid bounty: a spawner on the old wall line that keeps a giant
# evoker on the field. MaxNearbyEntities:1 is the "only one at a time"
# rule — the spawner skips an attempt while an evoker is inside its
# SpawnRange box, and tries again on the next delay once it is dead or
# has wandered off. Unlike the team defenders these keep their AI: they
# pick their own targets, throw fangs and summon vexes, and are hostile
# to both teams. They drop nothing but XP: the totem is stripped by the
# loot table override in data/minecraft/loot_table/entities/evoker.json.
#
# ### MAP CONFIG ### mid of the map, on the old wall line.
# ### TUNING ###
#   entity       - 100 HP and double size. Health is in the same NBT as
#                  the attribute; it is read after it, so it is not
#                  clamped back to the base 24.
#   custom_spawn_rules - any light level, or it would only spawn at night
#   Min/MaxSpawnDelay  - ticks between attempts, 10-20 seconds
#   RequiredPlayerRange - a player has to be this close for it to run
#   SpawnRange   - spawn spread, and also the size of the "nearby" box
#                  that MaxNearbyEntities counts in
# ============================================================

setblock 30000 64 60000 minecraft:spawner{SpawnData:{entity:{id:"minecraft:evoker",Tags:["walls.evoker"],PersistenceRequired:1b,Glowing:1b,CustomName:{text:"Evoker",color:"gold"},CustomNameVisible:1b,attributes:[{id:"minecraft:max_health",base:100d},{id:"minecraft:scale",base:2d}],Health:100f},custom_spawn_rules:{block_light_limit:{min_inclusive:0,max_inclusive:15},sky_light_limit:{min_inclusive:0,max_inclusive:15}}},MinSpawnDelay:200,MaxSpawnDelay:400,SpawnCount:1,MaxNearbyEntities:1,RequiredPlayerRange:32,SpawnRange:8} replace
