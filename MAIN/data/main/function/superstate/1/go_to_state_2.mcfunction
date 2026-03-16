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

# hide bossbar and stuff
bossbar set main:timer visible false

execute if score ?minigame_id main.state matches 1 run function main:superstate/1/macro_get_intro with storage main:game display[1]
execute if score ?minigame_id main.state matches 2 run function main:superstate/1/macro_get_intro with storage main:game display[2]
execute if score ?minigame_id main.state matches 3 run function main:superstate/1/macro_get_intro with storage main:game display[3]
execute if score ?minigame_id main.state matches 4 run function main:superstate/1/macro_get_intro with storage main:game display[4]
execute if score ?minigame_id main.state matches 5 run function main:superstate/1/macro_get_intro with storage main:game display[5]
execute if score ?minigame_id main.state matches 6 run function main:superstate/1/macro_get_intro with storage main:game display[6]

# --- SET STARTING TIME ---
scoreboard players set ?supertimer main.time 0

#   this dictates how long to wait before the "how to play game" tellraw that tells people to open chat
#       "?how_many_characters_are_in_the_gamename main.temp" is set inside macro_get_intro
#       2 ticks (0.1s) per character
scoreboard players operation ?event.start_showing_howtoplay main.time = ?how_many_characters_are_in_the_gamename main.temp
scoreboard players operation ?event.start_showing_howtoplay main.time *= #2 main.const
#   120 ticks before the title is shown, then 60 ticks after
scoreboard players add ?event.start_showing_howtoplay main.time 180

#   actual slides begin showing 3 seconds after that tellraw
scoreboard players operation ?event.start_showing_howtoplay_slides main.time = ?event.start_showing_howtoplay main.time
scoreboard players add ?event.start_showing_howtoplay_slides main.time 60

# --- BEGIN SUPERSTATE 2 ---
scoreboard players set ?superstate main.state 2