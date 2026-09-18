# ============================================================
# walls:golem/resolve
# Called by: walls:golem/tick
# Executor:  Server
# ============================================================

scoreboard players set ?golem_state walls.state 0

# someone got credited for it, walls:events/on_kill_golem already paid out
execute if score ?golem_claimed walls.state matches 1 run return 0

# no killer: the reward is left on the ground where it fell
scoreboard players operation #dx walls.temp = #gx walls.state
scoreboard players operation #dy walls.temp = #gy walls.state
scoreboard players operation #dz walls.temp = #gz walls.state
scoreboard players set #dn walls.temp 15
function walls:econ/drop_at
tellraw @a {text:"The Iron Golem fell with nobody to credit. Its 15 💠 are on the ground.",color:"gray"}
