# ============================================================
# walls:on/introstart
# Called by: main:superstate/2/macro_intro (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 2.
# Loads the arena, then builds the map's entities while everybody
# is watching the intro cutscene.
# ============================================================

# No result yet. walls:end/win_data / win_it / draw
# overwrite this, and walls:end/finish reads it to pick which
# main:api/end_game_* to hand off to. 0 = nobody won.
scoreboard players set #winner walls.state 0

# The whole 256x256 arena stays loaded for the entire game. Without
# this, the wall fill fails and every selector silently misses the
# ravagers, villagers and mobs in whatever corner has nobody standing
# in it — and an empty ravager selector reads as "that team lost".
#
# forceload add is capped at 256 chunks per command, and the arena is
# exactly 16x16 chunks, so this goes in as four 8x8 quadrants. Asking
# for the whole thing in one command is right on the cap, and asking
# for 29872..30128 (one block too far, 17x17 = 289 chunks) fails
# outright and force-loads nothing at all.
forceload add 29872 59872 29999 59999
forceload add 29872 60000 29999 60127
forceload add 30000 59872 30127 59999
forceload add 30000 60000 30127 60127

# wipe anything left behind by a previous run / reload
kill @e[type=ravager,tag=walls.tower]
kill @e[type=armor_stand,tag=walls.tower_anchor]
#   leftovers from the warden and iron golem versions of this pack
kill @e[type=warden,tag=walls.warden]
kill @e[type=iron_golem,tag=walls.golem]
kill @e[type=villager,tag=walls.shop]
kill @e[type=evoker,tag=walls.evoker]
execute positioned 30000 64 60000 run kill @e[type=vex,distance=..400]

# Chunks from a forceload finish loading over the next few ticks, and
# the shop villagers need to be selectable the tick after they are
# summoned, so give the arena a second to come up first.
schedule function walls:map/setup 20t replace
