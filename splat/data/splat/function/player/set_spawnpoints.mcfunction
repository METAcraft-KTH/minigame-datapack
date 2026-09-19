# ============================================================
# splat:player/set_spawnpoints
# Called by: splat:on/gamestart, splat:on/player/rejoin
# Executor:  Server
#
# Where each team respawns. /spawnpoint takes a yaw only,
# no pitch.
# ### MAP CONFIG ### keep in sync with splat:on/gamestart.
# ============================================================

spawnpoint @a[scores={main.team=1}] -48 63 50070 0
spawnpoint @a[scores={main.team=2}] 2 69 49725 -90
