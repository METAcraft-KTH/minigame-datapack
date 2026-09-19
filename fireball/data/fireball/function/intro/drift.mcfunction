# ============================================================
# fireball:intro/drift
# Called by: fireball:on/introstart, then itself, every 10 ticks
# Executor:  Server
#
# Re-implements MAIN's cutscene camera drift for the nether.
#
# main:superstate/2/tick moves the camera with
#   ... as @n[type=block_display,tag=main.camera] at @s run tp @s ~ ~ ~.5
# and that @n resolves in MAIN's own execution dimension, which is the
# overworld. The moment fireball:on/introstart carries the camera to
# the nether roof, MAIN's line stops matching anything and the shot
# freezes for the whole 45 second cutscene. So we drive it ourselves.
#
# This is a self-rescheduling loop, NOT a tick.json — the pack still
# registers minecraft:load and nothing else, so there is no chance of
# double-execution with MAIN's tick.
# ============================================================

# The cutscene is over, or was never running. Let the loop die.
#   this also covers a server restart mid-cutscene: the schedule
#   survives in level.dat, fires once on the way back up, and returns.
execute unless score ?superstate main.state matches 2 run return 0

# 0.5 blocks every 10 ticks, the same rate MAIN uses, and straight
# down +Z rather than along the camera's pitched look vector — the
# camera is supposed to fly level over the lava, not descend into it.
# It was summoned with teleport_duration:12, so the client smooths
# the hops out into a glide instead of stuttering.
execute in minecraft:the_nether as @n[type=block_display,tag=main.camera] at @s run tp @s ~ ~ ~.5

schedule function fireball:intro/drift 10t replace
