# ============================================================
# walls:tower/add_health
# Called by: walls:tower/tick
# Executor:  One ravager
#
# Adds this ravager's health onto #sum walls.temp.
# ============================================================

execute store result score #hp walls.temp run data get entity @s Health
scoreboard players operation #sum walls.temp += #hp walls.temp
