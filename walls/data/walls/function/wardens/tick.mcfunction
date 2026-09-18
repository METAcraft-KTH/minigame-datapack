# ============================================================
# walls:wardens/tick
# Called by: walls:_tick
# Executor:  Server
#
# Keeps both warden bossbars in sync, announces losses, and ends
# the game when one side runs out of wardens.
# ============================================================

# --- COMBINED HEALTH PER SIDE ---
scoreboard players set #sum walls.temp 0
execute as @e[type=warden,tag=walls.warden.it] run function walls:wardens/add_health
scoreboard players operation #it_hp walls.state = #sum walls.temp

scoreboard players set #sum walls.temp 0
execute as @e[type=warden,tag=walls.warden.data] run function walls:wardens/add_health
scoreboard players operation #data_hp walls.state = #sum walls.temp

execute store result bossbar walls:it value run scoreboard players get #it_hp walls.state
execute store result bossbar walls:data value run scoreboard players get #data_hp walls.state

# --- "A WARDEN HAS FALLEN" ---
execute store result score #n walls.temp if entity @e[type=warden,tag=walls.warden.it]
execute if score #n walls.temp < ?it_wardens walls.state run function walls:wardens/it_fell
scoreboard players operation ?it_wardens walls.state = #n walls.temp

execute store result score #n walls.temp if entity @e[type=warden,tag=walls.warden.data]
execute if score #n walls.temp < ?data_wardens walls.state run function walls:wardens/data_fell
scoreboard players operation ?data_wardens walls.state = #n walls.temp

# --- WIN CHECK ---
#   only once the wall is down, and only while the wardens are
#   known to have been placed, so an empty selector during setup
#   cannot hand somebody a free win
execute if score ?ready walls.state matches 1 if score ?phase walls.state matches 2 unless entity @e[type=warden,tag=walls.warden.it] run function walls:end/win_data
execute if score ?ready walls.state matches 1 if score ?phase walls.state matches 2 unless entity @e[type=warden,tag=walls.warden.data] run function walls:end/win_it
