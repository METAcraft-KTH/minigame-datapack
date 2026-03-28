# ============================================================
# race:state/ready/tick
# Called by: race:on/gametick (every tick during ready phase)
# Executor:  Server
# ============================================================
# Ready phase countdown (20 seconds = 400 ticks)

scoreboard players add ?phase_timer race.timer 1

# Calculate seconds remaining (400 - timer) / 20
scoreboard players set #temp race.state 400
scoreboard players operation #temp race.state -= ?phase_timer race.timer
scoreboard players operation #temp race.state /= #20 main.const

# Display countdown on actionbar
execute if score #temp race.state matches 1.. run title @a[tag=race.playing] actionbar [{"text":"Starting in ","color":"yellow"},{"score":{"name":"#temp","objective":"race.state"},"color":"gold"},{"text":" seconds...","color":"yellow"}]

# Transition to play phase when timer reaches 400 ticks
execute if score ?phase_timer race.timer matches 400 run function race:state/play/enter
