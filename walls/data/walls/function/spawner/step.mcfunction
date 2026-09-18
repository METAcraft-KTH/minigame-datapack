# ============================================================
# walls:spawner/step
# Called by: walls:spawner/ray, and itself
# Executor:  The placing player, positioned on the ray
#
# One 0.1-block step along the look vector. The block they just
# placed sits between their eyes and whatever face they clicked,
# so the first spawner the ray meets is always the right one.
# ============================================================

execute if block ~ ~ ~ minecraft:spawner run return run function walls:spawner/place with storage walls:spawner pending

scoreboard players remove #ray walls.temp 1
execute if score #ray walls.temp matches 1.. positioned ^ ^ ^0.1 run function walls:spawner/step
