# ============================================================
# tgttos:on/player/rejoin
# Called by: main:private/call/rejoin
# Executor:  Player who reconnected
#
# INCLUDING first-time joiners — those are handled by
# tgttos:on/player/latejoin instead, which MAIN calls right after.
# ============================================================

execute unless score @s main.iwashere matches 1 run return 0

# nobody is ever dead for longer than a tick in this game, so
# there is no disconnected state to restore beyond the mode and
# the effect. They keep the position they logged out at.
gamemode adventure @s
function tgttos:player/give_regen

function tgttos:player/set_spawnpoints
bossbar set tgttos:data players @a
bossbar set tgttos:it players @a
