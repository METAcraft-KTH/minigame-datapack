# ============================================================
# walls:shop/tick
# Called by: walls:_tick
# Executor:  Server
#
# Makes every shop villager turn to look at the nearest player
# within 10 blocks. Spectators (admins) are ignored. With nobody
# in range the villager keeps its last facing.
# ============================================================

# Inside "at @s", @p is the player nearest to that villager, and
# the selector filters apply before the nearest one is picked.
#execute as @e[type=villager,tag=walls.shop] at @s if entity @p[distance=..10,gamemode=!spectator] facing entity @p[distance=..10,gamemode=!spectator] eyes run tp @s ~ ~ ~ ~ ~
