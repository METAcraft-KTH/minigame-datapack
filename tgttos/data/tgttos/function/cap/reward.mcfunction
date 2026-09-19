# ============================================================
# tgttos:cap/reward
# Called by: tgttos:cap/cap_data, tgttos:cap/cap_it
# Executor:  A player who was standing on the point as it fell
#
# Everyone who held the point gets paid, not just one of them —
# the last 10 seconds of a capture are usually the fight.
# ============================================================

scoreboard players add @s tgttos.st.caps 1
