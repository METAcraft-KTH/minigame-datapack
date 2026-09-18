# ============================================================
# walls:player/set_spawnpoints
# Called by: walls:on/gamestart, rejoin, latejoin
# Executor:  Server
#
# immediate_respawn is on, so this is where players land the
# instant they die — before walls:on/player/death even runs.
# ### MAP CONFIG ### keep in sync with walls:player/send_to_spawn.
# ============================================================

spawnpoint @a[team=main.it] 29880 64 60000 -90 0
spawnpoint @a[team=main.data] 30120 64 60000 90 0
