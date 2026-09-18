# ============================================================
# walls:tower/melee
# Called by: walls:tower/tick, every 30 ticks
# Executor:  Server
#
# The defenders are NoAI (see walls:map/summon_tower), so their swings
# come from here. 30 ticks is a slow, heavy, ravager-looking cadence.
# ============================================================

scoreboard players set ?tower_melee walls.timer 30

execute as @e[type=ravager,tag=walls.tower.it] at @s run function walls:tower/melee_hit {team:"main.data"}
execute as @e[type=ravager,tag=walls.tower.data] at @s run function walls:tower/melee_hit {team:"main.it"}
