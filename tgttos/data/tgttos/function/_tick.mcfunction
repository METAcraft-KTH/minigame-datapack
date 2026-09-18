# ============================================================
# tgttos:_tick
# Called by: tgttos:on/gametick
# Executor:  Server
#
# Internal dispatcher for the active minigame.
# ============================================================

# a win was declared earlier this tick / last tick and MAIN has not
# taken us out of superstate 3 yet
execute if score ?over tgttos.state matches 1 run return 0

scoreboard players add ?match_timer tgttos.timer 1
scoreboard players add ?sec_timer tgttos.timer 1
scoreboard players add ?arrow_timer tgttos.timer 1

# --- ALWAYS-ON SYSTEMS ---
function tgttos:player/tick
function tgttos:arrow/tick
function tgttos:cap/tick
function tgttos:objective/tick

# objective/tick may have just ended the game. MAIN stops calling us
# from the next tick, but the rest of THIS tick still has to be told:
# main:api/end_game has already cleared everybody's inventory, and
# the restock below would happily hand it all straight back.
execute if score ?over tgttos.state matches 1 run return 0

# --- THROTTLED SYSTEMS ---
execute if score ?sec_timer tgttos.timer matches 20.. run function tgttos:util/second
execute if score ?arrow_timer tgttos.timer matches 100.. run function tgttos:util/arrow_refill

# --- BACKSTOP ---
#   15 minutes. Nobody should ever see this; it exists so a game
#   where both teams stall out still hands the event back on time.
execute if score ?match_timer tgttos.timer matches 18000.. run function tgttos:end/timeout
