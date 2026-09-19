# ============================================================
# splat:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Player who rejoined the server
#
# INCLUDING FIRST-TIME JOINERS!
# Late joiners are handled in on/player/latejoin instead.
# ============================================================

# Late joiners get spectator in on/player/latejoin.
execute unless score @s main.iwashere matches 1 run return 0

# MAIN sets worldspawn to the Data spawn, so make sure a returning
# player still has their own team's spawn point. Everything else
# about getting them back into the game is the mod's job.
function splat:player/set_spawnpoints
