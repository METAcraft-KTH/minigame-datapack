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

# --- THE WALL ---
#   raised here rather than built into the map, one slice per tick
scoreboard players set ?build_step walls.state 0
function walls:map/build_wall

# --- TOWERS ---
#   one ravager per corner of each team's own half.
#   yaw points each one in towards the middle of the map
execute positioned 29893 70 59901 run function walls:map/summon_tower {side:"it",team:"main.it",name:"IT Ravager",color:"#cc99ff",yaw:-45}
execute positioned 29910 63 60115 run function walls:map/summon_tower {side:"it",team:"main.it",name:"IT Ravager",color:"#cc99ff",yaw:-135}
execute positioned 30107 70 59901 run function walls:map/summon_tower {side:"data",team:"main.data",name:"Data Ravager",color:"#e83d84",yaw:45}
execute positioned 30090 63 60115 run function walls:map/summon_tower {side:"data",team:"main.data",name:"Data Ravager",color:"#e83d84",yaw:135}

# --- SHOPS ---
#   IT, just inside the west spawn
execute positioned 29884 64 59996 run function walls:map/shop/miner
execute positioned 29884 64 60000 run function walls:map/shop/trapper
execute positioned 29884 64 60004 run function walls:map/shop/trickster
#   Data, just inside the east spawn
execute positioned 30116 64 59996 run function walls:map/shop/miner
execute positioned 30116 64 60000 run function walls:map/shop/trapper
execute positioned 30116 64 60004 run function walls:map/shop/trickster

# --- BOOKKEEPING ---
#   derived here rather than assumed, so this function is safe to run
#   again mid-game (walls:debug/rebuild_map does exactly that) without
#   the missing ravagers reading as ones that just died
execute store result score ?it_towers walls.state if entity @e[type=ravager,tag=walls.tower.it]
execute store result score ?data_towers walls.state if entity @e[type=ravager,tag=walls.tower.data]
execute store result score #n walls.temp if entity @e[type=ravager,tag=walls.tower]
execute if score #n walls.temp matches 4 run scoreboard players set ?ready walls.state 1
execute unless score #n walls.temp matches 4 run scoreboard players set ?ready walls.state 0
