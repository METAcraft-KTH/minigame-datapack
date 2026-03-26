# ============================================================
# Called by: _tick (each tick, state 4)
# Executor:  Server
# 
# Runs every tick when the current minigame is in its
# outro phase. Display some postgame statistics and get
# ready to boot everyone back to lobby (superstate 1).
# 
# ============================================================

# --- FORCE EVERYONE TO SPECTATE ---
execute as @a[gamemode=!spectator] run gamemode spectator @s

# --- INCREMENT TIMER (works same as superstate 2) ---
scoreboard players add ?supertimer main.time 1


# --- WAIT 10 SECONDS BEFORE SHOWING SLIDES ---
execute if score ?supertimer main.time matches 120 run tellraw @a ["\n",{text:"Well played!",color:"#E83D84",bold:true}," Here are the top players...\n"]
execute if score ?supertimer main.time matches 200 run function main:superstate/4/macro_get_outro
execute if score ?supertimer main.time matches 200 run scoreboard players set ?supertimer main.time 401

# --- SHOW SLIDES ---
execute if score ?supertimer main.time matches 401 run function main:superstate/4/show_next_slide
# if there are slides to show, the timer will reset to 201.
# if there are no more slides, the timer will continue ticking.
execute if score ?supertimer main.time matches 402 run tellraw @a {text:"\nReturning to lobby in 10 seconds...\n",color:"gray",italic:true}

# --- DISPLAY SCREEN TRANSITION TITLE ---
# these values are just temporary until i figure out postgame stats
#   the timing is really long because lagspike
execute if score ?supertimer main.time matches 540 run title @a times 60 999999 0
execute if score ?supertimer main.time matches 540 run title @a title {"text":"ABA","font":"hexathlon:font","shadow_color":0}

# --- JUST BEFORE WE RETURN TO STATE 1, DISABLE THE CURRENT MINIGAME DATAPACK AND ENABLE THE NEXT ---
execute if score ?supertimer main.time matches 601 run function main:superstate/4/change_datapack

# --- RETURN TO LOBBY
execute if score ?supertimer main.time matches 602 unless score ?minigame_id main.state matches 6 run function main:superstate/4/go_to_state_1
execute if score ?supertimer main.time matches 602 if score ?minigame_id main.state matches 6 run function main:superstate/4/go_to_state_5
