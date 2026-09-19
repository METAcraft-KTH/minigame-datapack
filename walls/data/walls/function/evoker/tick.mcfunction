# ============================================================
# walls:evoker/tick
# Called by: walls:_tick
# Executor:  Server
# ============================================================

# The spawner is a normal block, so a player can mine it out. Put it
# back — the whole arena is force-loaded, so the check is always safe.
execute if score ?phase walls.state matches 2 unless block 30000 64 60000 minecraft:spawner run function walls:evoker/place
