# ============================================================
# exact:on/player/latejoin
# Called by: main:private/call/latejoin
# Executor:  Player who joined after game start
#
# Late joiners are enrolled as if they had been here since
# round 1, so they start on 5 hearts and immediately pay one
# for every round that has already been settled. Turn up late
# enough and that puts them straight out.
#
# Most arrivals are enrolled by exact:on/player/rejoin, which
# MAIN calls first; this covers the ones that never fires for.
# ============================================================

# MAIN fires latejoin for anyone without main.iwashere, and it never sets
# that at game start -- so on the first game of an event this also catches
# players who were here all along. Anyone who already has an exact.lastround
# is in the game already and must not be re-enrolled.
execute if score @s exact.lastround matches -2147483648..2147483647 run return 0

tp @s 50000 100 50000
function exact:util/enroll
function exact:util/catchup
