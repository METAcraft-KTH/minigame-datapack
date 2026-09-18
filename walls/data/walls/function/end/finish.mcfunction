# ============================================================
# walls:end/finish
# Called by: walls:end/win_it, walls:end/win_data
# Executor:  Server
#
# Tidy up everything this pack put into the world, then hand
# control back to MAIN.
# ============================================================

# stop the win check and the phase ticks from firing again
scoreboard players set ?ready walls.state 0
scoreboard players set ?phase walls.state 3

# hand MAIN's teams back the way we found them
team modify main.it friendlyFire true
team modify main.data friendlyFire true

# --- CLEAN UP ---
kill @e[type=iron_golem,tag=walls.golem]
kill @e[type=armor_stand,tag=walls.golem_anchor]
kill @e[type=evoker,tag=walls.evoker]
kill @e[type=villager,tag=walls.shop]
#   the evoker's own summons, and anything a team built
execute positioned 30000 64 60000 run kill @e[type=vex,distance=..400]
execute positioned 30000 64 60000 run kill @e[type=evoker_fangs,distance=..400]
execute positioned 30000 64 60000 run kill @e[type=iron_golem,distance=..400]
kill @e[type=zombie,tag=walls.mob]
kill @e[type=skeleton,tag=walls.mob]
kill @e[type=cow,tag=walls.mob]
#   bought spawners are left standing with the rest of what the teams
#   built, so switch them off rather than hunting for the blocks
gamerule spawner_blocks_work false
execute positioned 30000 64 60000 run kill @e[type=item,distance=..400]
execute positioned 30000 64 60000 run kill @e[type=tnt,distance=..400]
execute positioned 30000 64 60000 run kill @e[type=trident,distance=..400]
execute positioned 30000 64 60000 run kill @e[type=arrow,distance=..400]

bossbar set walls:it visible false
bossbar set walls:data visible false
bossbar set walls:timer visible false

#   matching the four quadrants from walls:on/introstart. Not "remove
#   all" — titlewriter keeps chunk 0,0 force-loaded.
forceload remove 29872 59872 29999 59999
forceload remove 29872 60000 29999 60127
forceload remove 30000 59872 30127 59999
forceload remove 30000 60000 30127 60127

# --- SUPERSTATE 3 -> 4 ---
function main:api/end_game
