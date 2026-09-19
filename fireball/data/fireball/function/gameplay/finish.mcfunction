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
function fireball:ball/kill_all
#   fireball:tick hands out permanent Saturation, which would
#   otherwise follow people into the lobby and the next game
effect clear @a[tag=!admin]

# hand MAIN's teams back the way we found them
team modify main.data friendlyFire true
team modify main.data collisionRule always
team modify main.it friendlyFire true
team modify main.it collisionRule always

# matching fireball:on/introstart. Not "remove all" — titlewriter
# keeps chunk 0,0 force-loaded.
forceload remove 49950 59940 50050 60060

# The platforms are left cratered where they stand.
# fireball:gameplay/reset_platforms re-places both templates from
# scratch at the start of the next run, and place_lava only ever
# has to be run once by hand.

# --- SUPERSTATE 3 -> 4 ---
function main:api/end_game
