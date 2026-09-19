# ============================================================
# tgttos:map/setup
# Called by: tgttos:on/introstart, tgttos:debug/rebuild_map
# Executor:  Server
#
# ############################################################
# ### THIS IS THE MAP CONFIG. EVERY HARD-CODED COORDINATE  ###
# ### IN THE PACK IS EITHER HERE, IN tgttos:player/        ###
# ### send_to_spawn / set_spawnpoints, OR IN _load's intro ###
# ### camera line.                                         ###
# ############################################################
#
# The coordinates below are the point ANCHORS. build_point puts
# the marker half a block in on X and Z from there, which lands it
# in the middle of the beacon's column — so the 5 block capture
# radius and the 9x9 floor are centred on the beam, not on a corner
# of it.
#
#   Data platform   20025 64 60000      Data point (1)  20025 64 60100
#   IT platform     19975 64 60000      IT point   (2)  19975 64 60100
#
# Everything is 100 blocks of open air apart. Each team's own
# point is straight ahead; the other one is a 112 block diagonal.
# ============================================================

# wipe anything left behind by a previous run / reload
kill @e[type=marker,tag=tgttos.point]

# --- CONTROL POINTS ---
execute positioned 20025 64 60100 run function tgttos:map/build_point {n:"1"}
execute positioned 19975 64 60100 run function tgttos:map/build_point {n:"2"}

# --- SPAWN PLATFORMS ---
#   wool, like the point floors: only concrete can be broken in
#   this game, so nobody can shoot or mine their own spawn away.
fill 20020 63 59995 20029 63 60004 minecraft:pink_wool
fill 19970 63 59995 19979 63 60004 minecraft:light_blue_wool
