# ============================================================
# Called by: main:superstate/1/tick (once)
# Executor:  Server
# 
# Runs ONCE, when supertimer is 0 and the superstate
# changes from 1 to 2.
# 
# ============================================================

# iirc this doesnt show the "your gamemode has been changed" popup
execute as @a run gamemode spectator

# --- CALL GAMESTART FUNCTION ---
execute if score ?minigame_id main.state matches 1 run function main:superstate/2/macro_call_minigame_gamestart with storage main:game display[1]
execute if score ?minigame_id main.state matches 2 run function main:superstate/2/macro_call_minigame_gamestart with storage main:game display[2]
execute if score ?minigame_id main.state matches 3 run function main:superstate/2/macro_call_minigame_gamestart with storage main:game display[3]
execute if score ?minigame_id main.state matches 4 run function main:superstate/2/macro_call_minigame_gamestart with storage main:game display[4]
execute if score ?minigame_id main.state matches 5 run function main:superstate/2/macro_call_minigame_gamestart with storage main:game display[5]
execute if score ?minigame_id main.state matches 6 run function main:superstate/2/macro_call_minigame_gamestart with storage main:game display[6]


# --- SET STARTING TIME ---
scoreboard players set ?supertimer main.time 0
scoreboard players set ?slidetimer main.time 0
#   "?how_many_characters_are_in_the_gamename main.temp" is set inside macro_get_intro
#   4 ticks (0.20s) per character
scoreboard players operation ?event.start_showing_howtoplay main.time = ?how_many_characters_are_in_the_gamename main.temp
scoreboard players operation ?event.start_showing_howtoplay main.time *= #4 main.const
#   120 ticks before the title is shown, then 60 seconds
scoreboard players add ?event.start_showing_howtoplay main.time 120
scoreboard players add ?event.start_showing_howtoplay main.time 60

# --- BEGIN SUPERSTATE 2 ---
scoreboard players set ?superstate main.state 2