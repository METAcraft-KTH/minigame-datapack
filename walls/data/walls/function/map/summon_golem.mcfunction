# ============================================================
# walls:map/summon_golem
# Called by: walls:map/setup, walls:golem/watchdog
# Executor:  Server, positioned where the golem should stand
#
# Macro args: {side:"it",team:"main.it",name:"IT Golem",color:"#cc99ff",yaw:-45}
#
# One of the four team defenders: 300 HP, double size, immobile.
#
# --- WHY NoAI, WITH THE ATTACKS DRIVEN BY THIS PACK ---
# An iron golem's own brain is no use to us here. It wanders off its
# post, and it will not touch an enemy player at all: a golem only ever
# targets hostile mobs, plus whoever hit it last. A defender that
# ignores anybody walking calmly past it is not a defender.
#
# So the AI is off, and walls:golem/melee does the swinging on a fixed
# cadence against everybody on the opposing team. It is deterministic
# and it cannot be walked around.
#
# NoGravity keeps it standing when TNT takes the ground out from under
# it, and walls:golem/tick pins it to its anchor every tick, because
# players can still shove a mob that has no AI.
#
# --- WHY THE NBT IS THIS SHORT ---
# Entity NBT is validated as one unit: one field this version does not
# recognise makes the whole summon fail and you get nothing, silently.
# Every field below is one the working shop villagers already prove;
# health and size are applied by command afterwards for the same reason.
# ============================================================

# the anchor is a position marker, not a vehicle
kill @e[type=armor_stand,tag=walls.golem_anchor,distance=..4]
$summon armor_stand ~ ~ ~ {Tags:["walls.golem_anchor"],Rotation:[$(yaw)f,0f],Marker:1b,Invisible:1b,NoGravity:1b,Invulnerable:1b}

$summon iron_golem ~ ~ ~ {Tags:["walls.golem","walls.golem.$(side)","walls.tmp_golem"],Rotation:[$(yaw)f,0f],Team:"$(team)",CustomName:{text:"$(name)",color:"$(color)"},CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b}

# 300 HP each, so a team's two golems share a 600 HP bossbar.
# Lowering max_health drags current health down with it.
attribute @n[type=iron_golem,tag=walls.tmp_golem] max_health base set 300
#   twice the size, so they read as the map's centrepieces from a
#   distance. Scale grows the hitbox with the model, so the melee
#   radius in walls:golem/melee_hit is set to match.
attribute @n[type=iron_golem,tag=walls.tmp_golem] scale base set 2
attribute @n[type=iron_golem,tag=walls.tmp_golem] knockback_resistance base set 1
attribute @n[type=iron_golem,tag=walls.tmp_golem] explosion_knockback_resistance base set 1
#   belt and braces: tops it up to whatever max_health now is
effect give @n[type=iron_golem,tag=walls.tmp_golem] instant_health 1 30 true

data merge entity @n[type=iron_golem,tag=walls.tmp_golem] {NoGravity:1b,Glowing:1b}

execute unless entity @n[type=iron_golem,tag=walls.tmp_golem,distance=..8] run tellraw @a[tag=admin] {text:"[walls] a golem failed to summon — run the summon by hand in chat to see why.",color:"red"}
tag @n[type=iron_golem,tag=walls.tmp_golem] remove walls.tmp_golem
