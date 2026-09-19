# ====walls:place_spawner_skeleton========================================================
# walls:events/on_place_spawner_skeleton
# Called by: advancement walls:place_spawner_skeleton
# Executor:  The player who placed the spawner
#
# Pattern B: fires freely, guarded by the superstate check.
# The shop item carries nothing but a custom_data marker, so the
# block entity is written here. See walls:map/shop/trickster.
# ============================================================

advancement revoke @s only walls:place_spawner_skeleton
execute unless score ?superstate main.state matches 3 run return 0

data modify storage walls:spawner pending set value {spawn:{entity:{id:"minecraft:skeleton",Tags:["walls.mob"],equipment:{head:{id:"minecraft:iron_helmet",count:1}},drop_chances:{head:0.0f}},custom_spawn_rules:{block_light_limit:{min_inclusive:0,max_inclusive:15},sky_light_limit:{min_inclusive:0,max_inclusive:15}}},min:200,max:400}

# stamped with the placer's team rather than the shop's, so a spawner
# that changes hands still never turns on whoever put it down
execute if entity @s[team=main.it] run data modify storage walls:spawner pending.spawn.entity.Team set value "main.it"
execute if entity @s[team=main.data] run data modify storage walls:spawner pending.spawn.entity.Team set value "main.data"

function walls:spawner/ray
