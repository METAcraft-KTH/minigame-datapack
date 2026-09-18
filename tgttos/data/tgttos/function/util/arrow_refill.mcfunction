# ============================================================
# tgttos:util/arrow_refill
# Called by: tgttos:_tick (every 100 ticks)
# Executor:  Server
#
# One arrow every 5 seconds, for everyone still alive. There is
# no cap: the trade is that hoarding arrows means not being on
# a point while the other team is.
# ============================================================

scoreboard players set ?arrow_timer tgttos.timer 0

give @a[tag=!admin,gamemode=adventure] minecraft:arrow 1
