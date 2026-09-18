# ============================================================
# walls:debug/skip_to_drop
# Run by hand: function walls:debug/skip_to_drop
# Executor:  Anyone
#
# Jumps the match clock to 5 seconds before the wall drops, so the
# drop and everything after it can be tested without waiting out
# the 10 minute build phase.
# ============================================================

execute unless score ?superstate main.state matches 3 run tellraw @a {text:"[walls] not in a game right now — nothing to skip.",color:"red"}
execute unless score ?superstate main.state matches 3 run return 0

scoreboard players set ?match_timer walls.timer 11900
tellraw @a {text:"[walls] clock moved to 9:55. The wall drops in 5 seconds.",color:"yellow"}
