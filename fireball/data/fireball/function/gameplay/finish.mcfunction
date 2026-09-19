# ============================================================
# fireball:gameplay/finish
# Called by: fireball:api/game_ended
# Executor:  Server
#
# Tidy up everything this pack put into the world, then hand
# control back to MAIN.
# ============================================================

# stop fireball:tick from running the game loop for the rest of
# this tick — MAIN only stops calling us from the next one
function fireball:api/end_game_early

# --- CLEAN UP ---
#   normally inherited from fireball:on/gametick, but spelled out so
#   this is still safe to call by hand from a console
execute in minecraft:the_nether run function fireball:ball/kill_all
#   fireball:tick hands out permanent Saturation, which would
#   otherwise follow people into the lobby and the next game
effect clear @a[tag=!admin]

# hand MAIN's teams back the way we found them
team modify main.data friendlyFire true
team modify main.data collisionRule always
team modify main.it friendlyFire true
team modify main.it collisionRule always

# matching fireball:on/introstart. Not "remove all" — titlewriter
# keeps chunk 0,0 force-loaded, and while that one is in the overworld
# there is no reason to start clearing other packs' forceloads.
execute in minecraft:the_nether run forceload remove -64 -80 64 80

# The platforms are left cratered where they stand.
# fireball:gameplay/reset_platforms re-places both templates from
# scratch at the start of the next run, and place_lava only ever
# has to be run once by hand.

# --- SUPERSTATE 3 -> 4 ---
#   #winner fireball is set by victory_data / victory_it / game_over.
#   1 = Data, 2 = IT, 0 = draw (nobody takes the series point).
#
#   Back to the overworld first. We get here from inside fireball:tick,
#   which runs nether-scoped, and all three end_game functions run
#   "spawnpoint @a[tag=!admin] 0 64 50000" — a command that respects the
#   dimension it is called from. Hand off from the nether and the lobby
#   respawn point ends up buried in netherrack, which only shows up if
#   somebody dies during the outro.
execute if score #winner fireball matches 1 in minecraft:overworld run return run function main:api/end_game_data
execute if score #winner fireball matches 2 in minecraft:overworld run return run function main:api/end_game_it
execute in minecraft:overworld run function main:api/end_game
