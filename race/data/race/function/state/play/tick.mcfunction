# ============================================================
# race:state/play/tick
# Called by: race:on/gametick (every tick during play phase)
# Executor:  Server
# ============================================================
# Main game loop (7 minutes = 8400 ticks)

scoreboard players add ?phase_timer race.timer 1
scoreboard players add ?match_timer race.timer 1

# Display time remaining on actionbar
# 8400 ticks = 420 seconds = 7 minutes
# Time remaining = 8400 - phase_timer
scoreboard players set #timeleft race.state 8400
scoreboard players operation #timeleft race.state -= ?phase_timer race.timer
execute store result storage main:temp t int 1 run scoreboard players get #timeleft race.state
execute if score ?phase_timer race.timer matches 1 run function race:util/checkpoint/monitor_all

# Display actionbar with time remaining
title @a[tag=race.playing] actionbar [{"text":"Time: ","color":"aqua"},{"score":{"name":"#timeleft","objective":"race.state"},"color":"gold"},{"text":" ticks | Lap: ","color":"aqua"},{"score":{"name":"?lap_display","objective":"race.state"},"color":"gold"},{"text":"/3","color":"aqua"}]

# Transition to break phase when time runs out (8400 ticks)
execute if score ?phase_timer race.timer matches 8400 run function race:state/break/enter

# End the game if all players have finished
execute if score #finished_count race.state matches 1.. run function race:state/break/enter
