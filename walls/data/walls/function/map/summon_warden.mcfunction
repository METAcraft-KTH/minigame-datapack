# ============================================================
# walls:map/summon_warden
# Called by: walls:map/setup
# Executor:  Server, positioned where the warden should stand
#
# Macro args: {side:"it",team:"main.it",name:"IT Warden",color:"#cc99ff"}
#
# The warden is immobile (movement_speed 0) rather than riding a
# vehicle, which keeps its melee and its sonic boom working — if it
# can never reach you, it just shoots you instead.
# A warden only digs itself back into the ground if it is unnamed,
# so CustomName is what keeps it from despawning.
# It stays invulnerable until the wall drops so neither team can
# sabotage its own wardens during the build phase.
# ============================================================

$summon warden ~ ~ ~ {Tags:["walls.warden","walls.warden.$(side)"],Team:"$(team)",CustomName:{text:"$(name)",color:"$(color)"},CustomNameVisible:1b,Glowing:1b,PersistenceRequired:1b,Invulnerable:1b,Health:300f,attributes:[{id:"minecraft:max_health",base:300},{id:"minecraft:movement_speed",base:0},{id:"minecraft:knockback_resistance",base:1},{id:"minecraft:explosion_knockback_resistance",base:1}]}
