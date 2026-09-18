# ============================================================
# walls:player/send_to_spawn
# Executor:  The player to send home
#
# ### MAP CONFIG ### IT spawns on the west centre edge looking
# east, Data on the east centre edge looking west.
# ============================================================

execute if entity @s[team=main.it] run tp @s 29880 64 60000 -90 0
execute if entity @s[team=main.data] run tp @s 30120 64 60000 90 0
