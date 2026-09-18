# ============================================================
# tgttos:player/send_to_spawn
# Called by: tgttos:player/setup
# Executor:  The player to send home
#
# ### MAP CONFIG ### keep in sync with tgttos:player/set_spawnpoints.
# Both platforms face due south, towards the control points.
# ============================================================

execute if entity @s[team=main.data] run tp @s 20025 64 60000 0 0
execute if entity @s[team=main.it] run tp @s 19975 64 60000 0 0
