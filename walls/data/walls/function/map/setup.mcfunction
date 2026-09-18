# ============================================================
# walls:map/setup
# Called by: walls:on/introstart (once)
# Executor:  Server
#
# ############################################################
# ### THIS IS THE MAP CONFIG. EVERY HARD-CODED COORDINATE  ###
# ### IN THE PACK IS EITHER HERE, IN walls:map/wall_drop,   ###
# ### OR IN walls:player/send_to_spawn.                     ###
# ############################################################
#
# Map is a 256x256 slice centred on X=30000 Z=60000, so it runs
# from 29872/59872 to 30128/60128. The bedrock wall sits on the
# X=30000 line and splits the map into west (IT) and east (Data).
# Y=64 is a placeholder — set it to the actual ground level.
# ============================================================

# --- WARDENS ---
#   two per team, one in each corner of that team's half
execute positioned 29880 64 59880 run function walls:map/summon_warden {side:"it",team:"main.it",name:"IT Warden",color:"#cc99ff"}
execute positioned 29880 64 60120 run function walls:map/summon_warden {side:"it",team:"main.it",name:"IT Warden",color:"#cc99ff"}
execute positioned 30120 64 59880 run function walls:map/summon_warden {side:"data",team:"main.data",name:"Data Warden",color:"#e83d84"}
execute positioned 30120 64 60120 run function walls:map/summon_warden {side:"data",team:"main.data",name:"Data Warden",color:"#e83d84"}

#   summoning with a max_health attribute does not lower the warden's
#   current health, so top every one of them up to their new 300 cap
effect give @e[type=warden,tag=walls.warden] instant_health 1 30 true

# --- SHOPS ---
#   IT, just inside the west spawn
execute positioned 29884 64 59996 run function walls:map/shop/miner
execute positioned 29884 64 60000 run function walls:map/shop/trapper
execute positioned 29884 64 60004 run function walls:map/shop/trickster {team:"main.it"}
#   Data, just inside the east spawn
execute positioned 30116 64 59996 run function walls:map/shop/miner
execute positioned 30116 64 60000 run function walls:map/shop/trapper
execute positioned 30116 64 60004 run function walls:map/shop/trickster {team:"main.data"}
