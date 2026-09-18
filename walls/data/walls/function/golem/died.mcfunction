# ============================================================
# walls:golem/died
# Called by: walls:golem/tick
# Executor:  Server
#
# Wait a few ticks before deciding nobody killed it — the kill
# advancement can land on a later tick than the entity vanishing.
# ============================================================

scoreboard players set ?golem_state walls.state 2
scoreboard players set ?golem_grace walls.timer 3
