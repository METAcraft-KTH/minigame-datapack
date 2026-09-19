# ============================================================
# splat:on/gamestart
# Called by: main:private/call/gamestart (once)
# Executor:  Server
#
# Runs ONCE: on the tick when superstate changes to 3.
# From here on the MOD is in control of the minigame.
# ============================================================

# --- SPAWN THE TEAMS ---
#   MAIN already teleported everyone to player_starting_coords,
#   which is the Data spawn. Split the teams up from there.
#   main.team 1 = Data, 2 = IT.
#   ### MAP CONFIG ###
function splat:player/set_spawnpoints
tp @a[scores={main.team=1}] -48 63 50070 0 0
tp @a[scores={main.team=2}] 2 69 49725 -90 0

# --- HAND OVER TO THE MOD ---
#   Raise the flag the mod polls. The mod starts its game logic
#   on the tick it sees this become 1, and calls main:api/end_game
#   by itself when the game is over.
scoreboard players set ?running splat.state 1
