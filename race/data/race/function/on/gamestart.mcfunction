# ============================================================
# race:on/gamestart
# Called by: main:private/call/gamestart (once)
# Executor:  Server
# ============================================================
# Initialize the game state when superstate changes to 3.

# Mark all online players as active racers
tag @a add race.playing
tag @a remove race.finished
scoreboard players set @a race.lap 0
scoreboard players set @a race.checkpoint 0
scoreboard players set @a race.stats.lap 0
scoreboard players set @a race.stats.time 0

# Initialize game state
scoreboard players set ?phase race.state 0
scoreboard players set ?phase_timer race.timer 0
scoreboard players set ?match_timer race.timer 0

# Start the ready phase (20 seconds = 400 ticks)
function race:state/ready/enter
