# ============================================================
# walls:wardens/add_health
# Called by: walls:wardens/tick
# Executor:  One warden
#
# Adds this warden's health onto #sum walls.temp.
# ============================================================

execute store result score #hp walls.temp run data get entity @s Health
scoreboard players operation #sum walls.temp += #hp walls.temp
