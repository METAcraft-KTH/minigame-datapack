# ============================================================
# fireball:on/introstart
# Called by: main:superstate/2/macro_intro (once)
# Executor:  Server
#
# Runs ONCE: five ticks after superstate changes to 2, by which
# point MAIN has already summoned its cutscene camera and bound
# everybody to it.
# ============================================================

# No result yet. fireball:gameplay/victory_data / victory_it / game_over
# overwrite this, and fireball:gameplay/finish reads it to pick which
# main:api/end_game_* to hand off to. 0 = nobody won.
scoreboard players set #winner fireball 0

# --- FORCELOAD THE ARENA ---
# The whole playfield has to stay loaded for the whole game. The
# fireball is an item_display walking itself forward one step at a
# time, and a ball that drifts into an unloaded chunk stops ticking
# and never comes back. Nobody stands in the middle either, so the
# lava field between the platforms has no player keeping it up.
#
# X -64..64, Z -80..80 is chunks -4..4 by -5..5, 99 chunks — well
# under forceload's 256 chunk per command cap. That covers both
# platforms and everything between them; the lava sheet runs out to
# 180 blocks but nothing ever goes that far.
execute in minecraft:the_nether run forceload add -64 -80 64 80

# --- CARRY THE CUTSCENE INTO THE NETHER ---
#   MAIN summoned its camera in the overworld and put everyone in
#   spectator watching it, because main:superstate/1/macro_summon_camera
#   teleports with a bare "tp @a $(camera_coords)" and /tp has no
#   dimension argument — there is no way to express "the nether" in
#   the coordinate string MAIN reads out of main:intro. The arena is
#   on the nether roof, so we move the whole thing across ourselves.
#   This callback is the first hook MAIN gives us to do it.
#
#   Cost: one dimension change a quarter second into the cutscene.
execute in minecraft:overworld as @e[type=block_display,tag=main.camera] in minecraft:the_nether run tp @s 0 149 -50 0 25
execute in minecraft:the_nether run tp @a 0 149 -50 0 25

#   The teleport unbinds anyone who was spectating, and MAIN cannot
#   put them back. Its re-bind is
#     execute as @a[gamemode=spectator] unless entity @n[...] run spectate @n[...] @s
#   and "as" does not move the execution position, so both of those @n
#   lookups happen wherever MAIN is running — the overworld. Neither
#   one can see a camera on the nether roof, so the guard passes and
#   the spectate then matches nothing. This is the only binding there
#   is, and nothing later un-does it: MAIN only re-applies spectator
#   mode to players who are not already in it.
execute in minecraft:the_nether as @a[gamemode=spectator] run spectate @n[type=block_display,tag=main.camera] @s

#   MAIN's camera drift dies on exactly the same overworld-scoped @n,
#   so take that over too. See fireball:intro/drift.
function fireball:intro/drift
