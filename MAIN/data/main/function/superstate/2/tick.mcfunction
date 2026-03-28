# ============================================================
# Called by: _tick
# Executor:  Server
# 
# Runs per tick when the intro cutscene is playing.
# 
# ============================================================

# --- INCREMENT TIMER ---
scoreboard players add ?supertimer main.time 1

# --- call introtick 5 ticks after intro starts so the chunks can load ---
execute if score ?supertimer main.time matches 5 run function main:superstate/2/macro_intro with storage main:temp


# --- FORCE EVERYONE TO WATCH CUTSCENE ---
execute as @a[gamemode=!spectator] run gamemode spectator @s
execute as @a[gamemode=spectator] unless entity @n[type=block_display,tag=main.camera,distance=...15] run spectate @n[type=block_display,tag=main.camera] @s
#   slowly slowly tp camera forward
#       because the game refuses to update the client if you have high ping and are constantly tp'd,
#       we'll tp 0.5s at a time, and the entity has teleport_duration:12 to compensate.
scoreboard players operation ?every10ticks main.time = ?supertimer main.time
scoreboard players operation ?every10ticks main.time %= #10 main.const
execute if score ?every10ticks main.time matches 0 as @n[type=block_display,tag=main.camera] at @s run tp @s ~ ~ ~.5


# --- DO STUFF BASED ON TIMERS ---
execute if score ?supertimer main.time matches 80 run title @a times 0 40 20
#   this superstate begins by typing subtitle & title using titlewriter.
execute if score ?supertimer main.time matches 80..119 run title @a title ""
execute if score ?supertimer main.time matches 80 as @a at @s run function tl:title {text:[{text:"G",color:"#E83D84"},"A","M","E"," ",{score:{name:"?minigame_id",objective:"main.state"}}],tick:3,location:"subtitle",sound:"block.note_block.bit master @s ~ ~ ~ 1 1.1 1",args:{is_literal:true}}
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 1 run function main:superstate/2/tick_macro_show_title with storage main:game display[1]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 2 run function main:superstate/2/tick_macro_show_title with storage main:game display[2]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 3 run function main:superstate/2/tick_macro_show_title with storage main:game display[3]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 4 run function main:superstate/2/tick_macro_show_title with storage main:game display[4]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 5 run function main:superstate/2/tick_macro_show_title with storage main:game display[5]
execute if score ?supertimer main.time matches 120 if score ?minigame_id main.state matches 6 run function main:superstate/2/tick_macro_show_title with storage main:game display[6]
# (i got a little lazy sorry)

# --- HOW TO PLAY (first msg) ---
execute if score ?supertimer main.time = ?event.start_showing_howtoplay main.time run tellraw @a [{text:"\n",color:"yellow"},{storage:"main:temp",nbt:"gamename",color:"white",bold:1b}," — How to play ",{text:"(read chat)",color:"gray"}]
execute if score ?supertimer main.time = ?event.start_showing_howtoplay main.time as @a at @s run playsound entity.item.pickup master @s ~ ~ ~ .6 1 1

# --- SLIDES ---
execute if score ?supertimer main.time = ?event.start_showing_howtoplay_slides main.time run scoreboard players set ?slidetimer main.time -1
execute if score ?supertimer main.time >= ?event.start_showing_howtoplay_slides main.time run function main:superstate/2/tick_slide