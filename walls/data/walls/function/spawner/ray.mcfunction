# ============================================================
# walls:spawner/ray
# Called by: walls:events/on_place_spawner_*
# Executor:  The player who placed the spawner
# Preconditions: storage walls:spawner pending is filled
#
# placed_block hands us the player, not the block, so walk the
# player's line of sight until we run into the spawner they just
# put down. Block interaction range is 4.5, so 50 steps of 0.1
# reaches past anything they could have placed.
#
# "anchored eyes positioned ^ ^ ^" moves the start of the ray up to
# eye level. The "anchored feet" right after is what stops every
# later step from adding the eye height a second time.
# ============================================================

scoreboard players set #ray walls.temp 50
execute at @s anchored eyes positioned ^ ^ ^ anchored feet run function walls:spawner/step
