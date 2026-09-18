# ============================================================
# tgttos:arrow/pop
# Called by: tgttos:arrow/land
# Executor:  The arrow, positioned on a wool block
#
# Plain setblock rather than "setblock air destroy": block_drops
# is off for this game, so destroy would only be for the sound,
# and playing it ourselves is one fewer thing to be wrong about.
# ============================================================

setblock ~ ~ ~ minecraft:air
playsound minecraft:block.wool.break block @a ~ ~ ~ 1 1
execute on owner run scoreboard players add @s tgttos.st.wool 1
