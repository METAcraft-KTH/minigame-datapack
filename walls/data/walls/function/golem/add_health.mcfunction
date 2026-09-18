# ============================================================
# walls:golem/add_health
# Called by: walls:golem/tick
# Executor:  One golem
#
# Adds this golem's health onto #sum walls.temp.
# ============================================================

execute store result score #hp walls.temp run data get entity @s Health
scoreboard players operation #sum walls.temp += #hp walls.temp
