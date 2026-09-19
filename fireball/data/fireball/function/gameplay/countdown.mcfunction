# ============================================================
# fireball:gameplay/countdown
# Called by: fireball:gameplay/game_tick (first 200 ticks only)
# Executor:  Server
#
# The rules are told during MAIN's intro cutscene, so all this
# does is give everybody ten seconds to find their feet on the
# platform before the first fireball arrives.
# ============================================================

# warn-off-file execute-group

execute if score #game_time fireball matches 20 run title @a times 5 40 10
execute if score #game_time fireball matches 20 run title @a subtitle {text:"Bat it back. Don't get hit.",color:"gray"}
execute if score #game_time fireball matches 20 run title @a title {text:"Not Rocket League",color:"gold",bold:true}

execute if score #game_time fireball matches 100 run title @a times 0 20 5

execute if score #game_time fireball matches 100 run title @a title {text:"5",color:"yellow",bold:true}
execute if score #game_time fireball matches 120 run title @a title {text:"4",color:"yellow",bold:true}
execute if score #game_time fireball matches 140 run title @a title {text:"3",color:"gold",bold:true}
execute if score #game_time fireball matches 160 run title @a title {text:"2",color:"gold",bold:true}
execute if score #game_time fireball matches 180 run title @a title {text:"1",color:"red",bold:true}
execute if score #game_time fireball matches 100 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
execute if score #game_time fireball matches 120 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
execute if score #game_time fireball matches 140 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
execute if score #game_time fireball matches 160 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1
execute if score #game_time fireball matches 180 as @a at @s run playsound block.note_block.snare ui @s ~ ~ ~ 1 1 1

# --- FIRST BALL ---
execute if score #game_time fireball matches 200 run title @a title {text:"GO!",color:"red",bold:true}
execute if score #game_time fireball matches 200 as @a at @s run playsound entity.ender_dragon.growl ui @s ~ ~ ~ 1 1 1
execute if score #game_time fireball matches 200 run function fireball:gameplay/spawn_new_ball
