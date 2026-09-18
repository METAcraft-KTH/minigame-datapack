# ============================================================
# walls:evoker/tick
# Called by: walls:_tick
# Executor:  Server
# ============================================================

# --- FOLLOW THE EVOKER ---
#   so we know where to drop the crystals if it dies to something
#   that is not a player
execute if score ?evoker_state walls.state matches 1 as @e[type=evoker,tag=walls.evoker,limit=1] run function walls:evoker/track

# --- DEATH ---
execute if score ?evoker_state walls.state matches 1 unless entity @e[type=evoker,tag=walls.evoker] run function walls:evoker/died
execute if score ?evoker_state walls.state matches 2 run scoreboard players remove ?evoker_grace walls.timer 1
execute if score ?evoker_state walls.state matches 2 if score ?evoker_grace walls.timer matches ..0 run function walls:evoker/resolve

# --- NEXT SPAWN ---
execute if score ?phase walls.state matches 2 if score ?match_timer walls.timer >= ?next_evoker walls.timer run function walls:evoker/spawn
