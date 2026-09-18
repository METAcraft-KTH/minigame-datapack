# ============================================================
# exact:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Player who reconnected (first-time joiners included)
#
# Put them back where they were and charge them for the rounds
# they were away for. Players who were eliminated while offline,
# or who run out of hearts paying that bill, come back as
# spectators.
# ============================================================

tp @s 50000 100 50000

# No exact.lastround means they were not here when the game started. MAIN
# only calls latejoin for players without main.iwashere, and that score is
# never cleared between games, so a player who sat this one out cannot rely
# on it -- enroll them from here instead.
execute unless score @s exact.lastround matches -2147483648..2147483647 run function exact:util/enroll

function exact:util/catchup

execute if entity @s[tag=exact.dead] run gamemode spectator @s
execute unless entity @s[tag=exact.dead] run gamemode adventure @s
