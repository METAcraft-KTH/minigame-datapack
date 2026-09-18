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
# Both control point markers sit on a block CORNER (X and Z are
# whole numbers), so the 5 block capture radius and the 10x10
# floor are both exactly centred on them.
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
#   terracotta, not concrete: the pickaxe's can_break list is wool
#   plus the two concretes, so nobody can mine their own floor away.
fill 20020 63 59995 20029 63 60004 minecraft:pink_terracotta
fill 19970 63 59995 19979 63 60004 minecraft:light_blue_terracotta
