# ============================================================
# race:state/break/enter
# Called by: race:state/play/tick
# Executor:  Server
# ============================================================
# Initialize the break phase (end of game).

scoreboard players set ?phase race.state 2
scoreboard players set ?phase_timer race.timer 0

# Clean up all markers
kill @e[type=minecraft:marker,tag=race.checkpoint]
kill @e[type=minecraft:marker,tag=race.respawn]
kill @e[type=minecraft:marker,tag=race.utility]

# End the game
function main:api/end_game
