# ============================================================
# tgttos:player/give_regen
# Called by: tgttos:player/setup, tgttos:on/player/death,
#            tgttos:on/player/rejoin
# Executor:  The player to top up
#
# Permanent Regeneration I. Given once with a duration longer
# than any match rather than refreshed on a loop: regeneration
# heals on the ticks where its REMAINING duration is a multiple
# of 50, so re-applying it every tick would heal every tick.
# Dying clears it, which is why respawns come back through here.
# ============================================================

effect give @s minecraft:regeneration 3600 0 true
