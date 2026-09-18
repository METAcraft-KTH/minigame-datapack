# ============================================================
# tgttos:events/kill_reward
# Called by: tgttos:on/player/death, tgttos:events/on_player_kill
# Executor:  The player credited with the kill
# ============================================================

scoreboard players add @s tgttos.st.kills 1
function main:api/give_points {points:5,reason:"Kill"}
