# ============================================================
# tgttos:player/set_spawnpoints
# Called by: tgttos:on/gamestart, rejoin, latejoin
# Executor:  Server
#
# immediate_respawn is on, so this is where players land the
# instant they die — before tgttos:on/player/death even runs.
# ### MAP CONFIG ### keep in sync with tgttos:player/send_to_spawn.
# ============================================================

spawnpoint @a[team=main.data] 20025 64 60000 0 0
spawnpoint @a[team=main.it] 19975 64 60000 0 0
