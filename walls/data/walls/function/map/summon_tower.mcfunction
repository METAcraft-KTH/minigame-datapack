# ============================================================
# walls:map/summon_tower
# Called by: walls:map/setup, walls:tower/watchdog
# Executor:  Server, positioned where the tower should stand
#
# Macro args: {side:"it",team:"main.it",name:"IT Ravager",color:"#cc99ff",yaw:-45}
#
# One of the four team towers: a ravager, 300 HP, double size, immobile.
#
# --- WHY A RAVAGER ---
# Iron golems were the obvious pick and turned out to be the wrong one:
# right-clicking an iron golem with an iron ingot heals it 25 HP, that
# cannot be switched off, and the Miner sells iron — so a team could
# nurse its objectives back up faster than the other side could chew
# through them. Nothing heals a ravager off an item.
#
# --- WHY NoAI, WITH THE ATTACKS DRIVEN BY THIS PACK ---
# A ravager's own brain is no use to us: it charges off its post after
# whatever it noticed last, it is hostile to both teams' players
# indiscriminately, and a raised shield stuns it for 40 ticks. None of
# that suits a fixed objective.
#
# So the AI is off, and walls:tower/melee does the swinging on a fixed
# cadence against everybody on the opposing team. It is deterministic
# and it cannot be walked around.
#
# NoGravity keeps it standing when TNT takes the ground out from under
# it, and walls:tower/tick pins it to its anchor every tick, because
# players can still shove a mob that has no AI.
#
# --- WHY THE NBT IS THIS SHORT ---
# Entity NBT is validated as one unit: one field this version does not
# recognise makes the whole summon fail and you get nothing, silently.
# Every field below is one the working shop villagers already prove;
# health and size are applied by command afterwards for the same reason.
# ============================================================

# the anchor is a position marker, not a vehicle
kill @e[type=armor_stand,tag=walls.tower_anchor,distance=..4]
$summon armor_stand ~ ~ ~ {Tags:["walls.tower_anchor"],Rotation:[$(yaw)f,0f],Marker:1b,Invisible:1b,NoGravity:1b,Invulnerable:1b}

$summon ravager ~ ~ ~ {Tags:["walls.tower","walls.tower.$(side)","walls.tmp_tower"],Rotation:[$(yaw)f,0f],Team:"$(team)",CustomName:{text:"$(name)",color:"$(color)"},CustomNameVisible:1b,NoAI:1b,Invulnerable:1b,PersistenceRequired:1b}

# ### TUNING ### 300 HP each, so a team's two towers share a 600 HP
# bossbar. Raising max_health does NOT raise current health, so the
# ravager would otherwise sit at its base 100 out of 300 — that is
# exactly the bug that made the bossbars start a third full.
attribute @n[type=ravager,tag=walls.tmp_tower] max_health base set 300
#   twice the size, so they read as the map's centrepieces from a
#   distance. Scale grows the hitbox with the model, so the melee
#   radius in walls:tower/melee_hit is set to match.
attribute @n[type=ravager,tag=walls.tmp_tower] scale base set 2
attribute @n[type=ravager,tag=walls.tmp_tower] knockback_resistance base set 1
attribute @n[type=ravager,tag=walls.tmp_tower] explosion_knockback_resistance base set 1

data merge entity @n[type=ravager,tag=walls.tmp_tower] {NoGravity:1b,Glowing:1b}

# Fill it up to the new maximum, in its own command so a rejected Health
# cannot take the line above down with it. This has to run after
# max_health or it is clamped straight back to 100.
data merge entity @n[type=ravager,tag=walls.tmp_tower] {Health:300f}
#   belt and braces, in case Health ever stops being writable. Instant
#   Health heals 2 x 2^level, and amplifier 30 (level 31) is one of the
#   values that heals NOTHING AT ALL — which is why this line did not
#   cover for the clamp before. Amplifier 7 is 512 HP, capped at max.
effect give @n[type=ravager,tag=walls.tmp_tower] instant_health 1 7 true

execute unless entity @n[type=ravager,tag=walls.tmp_tower,distance=..8] run tellraw @a[tag=admin] {text:"[walls] a tower failed to summon — run the summon by hand in chat to see why.",color:"red"}
tag @n[type=ravager,tag=walls.tmp_tower] remove walls.tmp_tower

# also place a bedrock platform under it
fill ~-3 ~-1 ~-3 ~3 ~-1 ~3 bedrock
# and build protection
fill ~-3 ~ ~-3 ~3 ~6 ~3 moving_piston
