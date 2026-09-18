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
kill @e[type=warden,tag=walls.warden]
kill @e[type=iron_golem,tag=walls.golem]
kill @e[type=villager,tag=walls.shop]
kill @e[type=zombie,tag=walls.mob]
kill @e[type=skeleton,tag=walls.mob]
kill @e[type=cow,tag=walls.mob]
execute positioned 30000 64 60000 run kill @e[type=item,distance=..400]
execute positioned 30000 64 60000 run kill @e[type=tnt,distance=..400]
execute positioned 30000 64 60000 run kill @e[type=trident,distance=..400]
execute positioned 30000 64 60000 run kill @e[type=arrow,distance=..400]

bossbar set walls:it visible false
bossbar set walls:data visible false
bossbar set walls:timer visible false

forceload remove 29872 59872 30128 60128

# --- SUPERSTATE 3 -> 4 ---
function main:api/end_game
