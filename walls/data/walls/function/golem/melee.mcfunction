# ============================================================
# walls:golem/melee
# Called by: walls:golem/tick, every 30 ticks
# Executor:  Server
#
# The defenders are NoAI (see walls:map/summon_golem), so their swings
# come from here. 30 ticks is a slow, heavy, golem-looking cadence.
# ============================================================

scoreboard players set ?golem_melee walls.timer 30

execute as @e[type=iron_golem,tag=walls.golem.it] at @s run function walls:golem/melee_hit {team:"main.data"}
execute as @e[type=iron_golem,tag=walls.golem.data] at @s run function walls:golem/melee_hit {team:"main.it"}
