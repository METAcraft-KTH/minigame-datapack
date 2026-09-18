# ============================================================
# walls:golem/tick
# Called by: walls:_tick
# Executor:  Server
# ============================================================

# --- FOLLOW THE GOLEM ---
#   so we know where to drop the crystals if it dies to something
#   that is not a player
execute if score ?golem_state walls.state matches 1 as @e[type=iron_golem,tag=walls.golem,limit=1] run function walls:golem/track

# --- DEATH ---
execute if score ?golem_state walls.state matches 1 unless entity @e[type=iron_golem,tag=walls.golem] run function walls:golem/died
execute if score ?golem_state walls.state matches 2 run scoreboard players remove ?golem_grace walls.timer 1
execute if score ?golem_state walls.state matches 2 if score ?golem_grace walls.timer matches ..0 run function walls:golem/resolve

# --- NEXT SPAWN ---
execute if score ?phase walls.state matches 2 if score ?match_timer walls.timer >= ?next_golem walls.timer run function walls:golem/spawn
