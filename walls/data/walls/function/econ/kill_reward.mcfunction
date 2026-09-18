# ============================================================
# walls:econ/kill_reward
# Called by: walls:on/player/death
# Executor:  The credited killer
# ============================================================

give @s prismarine_crystals 5
scoreboard players add @s walls.st.cryst 5
scoreboard players add @s walls.st.kills 1
function main:api/give_points {points:5,reason:"Kill"}
