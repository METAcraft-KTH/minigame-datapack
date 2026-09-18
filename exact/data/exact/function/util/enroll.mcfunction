# ============================================================
# exact:util/enroll
# Called by: exact:on/player/rejoin, exact:on/player/latejoin
# Executor:  Player joining a game that is already in progress
#
# Puts a player who was not here at game start into the game on
# a full 5 hearts, booked as if they had been here since round 1.
# exact:util/catchup then charges them for everything they have
# already missed, which for a late enough arrival is all 5.
# ============================================================

# A leftover elimination or win from an earlier run of this pack is not theirs
tag @s remove exact.dead
tag @s remove exact.win

function exact:util/init_player

scoreboard players set @s exact.lastround 1
