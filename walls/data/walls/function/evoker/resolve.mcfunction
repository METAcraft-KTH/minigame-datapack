# ============================================================
# walls:evoker/resolve
# Called by: walls:evoker/tick
# Executor:  Server
# ============================================================

scoreboard players set ?evoker_state walls.state 0

# someone got credited for it, walls:events/on_kill_evoker already paid out
execute if score ?evoker_claimed walls.state matches 1 run return 0

# no killer: the reward is left on the ground where it fell
scoreboard players operation #dx walls.temp = #ex walls.state
scoreboard players operation #dy walls.temp = #ey walls.state
scoreboard players operation #dz walls.temp = #ez walls.state
scoreboard players set #dn walls.temp 15
function walls:econ/drop_at
tellraw @a {text:"The Evoker fell with nobody to credit. Its 15 💠 are on the ground.",color:"gray"}
