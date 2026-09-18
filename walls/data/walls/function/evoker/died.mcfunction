# ============================================================
# walls:evoker/died
# Called by: walls:evoker/tick
# Executor:  Server
#
# Wait a few ticks before deciding nobody killed it — the kill
# advancement can land on a later tick than the entity vanishing.
# ============================================================

scoreboard players set ?evoker_state walls.state 2
scoreboard players set ?evoker_grace walls.timer 3
