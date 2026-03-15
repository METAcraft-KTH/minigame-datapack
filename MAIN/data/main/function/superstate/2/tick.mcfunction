# ============================================================
# Called by: _tick
# Executor:  Server
# 
# Runs per tick when the intro cutscene is playing.
# 
# ============================================================

# --- FORCE EVERYONE TO WATCH CUTSCENE ---
execute as @a[gamemode=!spectator] run gamemode spectator @s
execute as @a[gamemode=!spectator] run spectate @n[type=block_display,tag=main.camera,distance=999999]
#   slowly slowly tp camera forward
execute as @n[type=block_display,tag=main.camera,distance=999999] at @s run tp @s ~ ~ ~.0125

# --- INCREMENT TIMER ---
scoreboard players add ?supertimer main.time 1

# --- DO STUFF BASED ON TIMERS ---
execute if score ?supertimer main.time matches 80 run title @a times 0 40 20
#   this superstate begins by typing subtitle & title using titlewriter.
execute if score ?supertimer main.time matches 80..119 run title @a title ""
execute if score ?supertimer main.time matches 80 as @a at @s run function tl:title {text:[{text:"G",color:"light_purple"},"A","M","E"," ",{score:{name:"?minigame_id",objective:"main.state"}}],tick:3,location:"subtitle",sound:"block.note_block.bit master @s ~ ~ ~ 1 1.1 1",args:{is_literal:true}}
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 1 run function main:superstate/2/tick_macro_show_title with storage main:game display[1]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 2 run function main:superstate/2/tick_macro_show_title with storage main:game display[2]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 3 run function main:superstate/2/tick_macro_show_title with storage main:game display[3]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 4 run function main:superstate/2/tick_macro_show_title with storage main:game display[4]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 5 run function main:superstate/2/tick_macro_show_title with storage main:game display[5]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 6 run function main:superstate/2/tick_macro_show_title with storage main:game display[6]
# (i got a little lazy sorry)

# --- START SHOWING SLIDES ---
execute if score ?supertimer main.time = ?event.start_showing_howtoplay main.time run tellraw @a [{text:"\n",color:"yellow"},{storage:"main:temp",nbt:"gamename",color:"white",bold:1b}," — How to play ",{text:"(read chat)",color:"gray"}]
execute if score ?supertimer main.time = ?event.start_showing_howtoplay_slides main.time run scoreboard players set ?slidetimer main.time -1
execute if score ?supertimer main.time >= ?event.start_showing_howtoplay_slides main.time run function main:superstate/2/tick_slide