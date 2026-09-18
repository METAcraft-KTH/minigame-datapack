# ============================================================
# walls:events/on_place_spawner_cow
# Called by: advancement walls:place_spawner_cow
# Executor:  The player who placed the spawner
#
# Pattern B: fires freely, guarded by the superstate check.
# The shop item carries nothing but a custom_data marker, so the
# block entity is written here. See walls:map/shop/trickster.
#
# Cows get no Team — they are noise, not a weapon, and either side
# should be able to cut them down.
# ============================================================

advancement revoke @s only walls:place_spawner_cow
execute unless score ?superstate main.state matches 3 run return 0

data modify storage walls:spawner pending set value {spawn:{entity:{id:"minecraft:cow",Tags:["walls.mob"]},custom_spawn_rules:{block_light_limit:{min_inclusive:0,max_inclusive:15},sky_light_limit:{min_inclusive:0,max_inclusive:15}}},min:400,max:800}
function walls:spawner/ray
