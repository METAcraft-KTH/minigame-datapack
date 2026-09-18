# ============================================================
# walls:_tick
# Called by: walls:on/gametick
# Executor:  Server
#
# Internal dispatcher for the active minigame.
# ============================================================

scoreboard players add ?match_timer walls.timer 1

# --- PHASES ---
execute if score ?phase walls.state matches 0 run function walls:state/prep/tick
execute if score ?phase walls.state matches 1 run function walls:state/drop/tick
execute if score ?phase walls.state matches 2 run function walls:state/fight/tick

# --- ALWAYS-ON SYSTEMS ---
function walls:player/tick
function walls:tower/tick
function walls:evoker/tick
function walls:trident/tick
